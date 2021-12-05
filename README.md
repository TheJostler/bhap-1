# bhap-1
the (Bad Hashing Algorithm in Python)

Not bad as in malicious, but just bad...

Written in Python an interpreter language it runs magnitudes slower that your average Hashing Algorithm.
For now, it can only process utf-8 encoded characters that are thrown at it from stdin.
And I'm sure all you python gurus will look at the monstrously unoptimised code and wail in disbelief, But hey...

It algorithms hashes OK!

# Use

In a Linux/Mac terminal:

Use pipe to throw stuff at it

Observe:

 `$ echo "Sausage & Bacon" | python3 bhap-1`
 
 returns
 
 _0xf846aa7b85c14a250191cc62445b1a7cf09654f752ec36eb1791fa3c20_
 
 ## Files
 to create a hash value for a file(encoded in plain text) concatonate the file and fire it at bhap-1
 
 As so:
 
 `$ cat file | python3 bhap-1`
 
returns

_0x1a77b6f63038e609bbcfab13f8581193587db83e6d45af681af4bdcfe14_

### Please note
the code was built and tested in Arch Linux, I'm yet to test it in Windows!
I'll update the readme as soon as I get the thing working!!

Enjoy!!

## Installing

#### You can install the binary executable using the install.sh shell script
1. download the install.sh script
2. open the file and edit the name variable if you want to call it something else (like Cheezburga, or Pizza)
3. give the script executable priv `sudo chmod +x install.sh`
4. then simply run it `./install.sh`

#### You can also run this program using only the python3 interpreter
`python3 bhap-1`
