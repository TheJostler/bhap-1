# bhap-1
the (Bad Hashing Algorithm in Python)

Not bad as in malicious, but just bad...

Written in Python an interpreter language it runs magnitudes slower that your average Hashing Algorithm.
For now, it can only process utf-8 encoded characters that are thrown at it from stdin.
But hey...

It algorithms hashes OK!?

# use

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

### Please note
the code was built and tested in Arch Linux, I'm yet to test it in Windows!
