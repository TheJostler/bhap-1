#!/bin/bash
name="bhap1sum" ##Edit this if you want to call your function by a different name after install (echo "Sausage & Bacon" | YummyBhap
customTarball="" ##Enter a directory path containing the tarball you want to install if you don't want to download it again (by entering a variable you cancel the download)
customFile="" ##Enter a directory path containing the bhap-1 binary if you don't want to use the downloaded one (by entering a variable you cancel the download)
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
if [[ $customTarball != "." || $customFile != "." ]]
then
	if [ ! -d $customTarball ]
	then
		echo "the tarball path specified in the script doesn't exist"
		exit 1
	fi
	if [ ! -d $customFile ]
	then
		echo "the binary file path specified in the script doesn't exist"
		exit 1
	fi
fi
tarball=$customTarball/"bhap1.v$ver.tar.gz"
filename=$customFile/"bhap1.v$ver"
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
if [[ $customTarball != "." || $customFile != "." ]]
then
	echo "Skipping download"
else
	wget $url
fi
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
