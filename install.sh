#!/bin/bash
name="bhap1sum"
if [ "$EUID" -ne 0 ]
then
	read -p "You are not running as super user and installation likely won't work, try anyway? y/n-- " yn
	if [ "$yn" = "y" ] || [ "$yn" = "Y" ] || [ "$yn" = "yes" ] || [ "$yn" = "Yes" ]
	then
		echo "Ok proceeding with install"
	else
		exit 0
	fi
fi
ver=$1
if [ "$1" = "" ]
then
	read -p "no version specified, try v1.0? y/n -- " yn
	if [ "$yn" = "y" ] || [ "$yn" = "Y" ] || [ "$yn" = "yes" ] || [ "$yn" = "Yes" ]
	then
		ver="1.0"
	else
		read -p "Please specify version (e.g \"1.1\")-- " ver
	fi
fi
custom=""
tarball=$custom"bhap1.v$ver.tar.gz"
filename=$custom"bhap1.v$ver"
echo $filename
url="https://github.com/TheJostler/bhap-1/releases/download/v$ver/bhap1.v$ver.tar.gz"
p=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
po=$(for n in {1..10};do echo $PATH | cut -d ":" -f $n | grep -v /home | grep -v /local; done)
findpath() {
	paths=("$@")
}
findpath $po
dp=${paths[0]}

tmpd=`mktemp -d -p "$p"`

if [[ ! "$tmpd" || ! -d "$tmpd" ]]; then
  echo "Could not create temp dir"
  exit 1
fi

function cleanup {      
  rm -rf "$tmpd"
  echo "Deleted temp working directory $tmpd"
}

trap cleanup EXIT

cd $tmpd
wget $url
if [ $? > 0 ]
then
	echo "could not find v$ver"
	echo "try installing v1.0"
	exit 1
fi
echo $tarball
tar -xzf $tarball
cp $filename $dp/$name
if [ ! -f $dp/$name ]
then
	echo "trying other directories"
	sleep 1
	for d in $paths
	do
		n=$(($n+1))
		cp $filename ${paths[$n]}/$name
		if [ $? = 0 ]
		then
			echo "installation complete"
			exit 0
		fi
		echo "could not install bhap"
		echo "try running as sudo"
		echo "or just downloading and installig manually"
		exit 1
	done
fi
