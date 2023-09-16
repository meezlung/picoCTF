# Special

## Overview
- **100 points**
- **General Skills**
- **Author: Lt 'Syreal' Jones**

## Description
Don't power users get tired of making spelling mistakes in the shell? Not anymore! Enter Special, the Spell Checked Interface for Affecting Linux. Now, every word is properly spelled and capitalized... automatically and behind-the-scenes! Be the first to test Special in beta, and feel free to tell us all about how Special streamlines every development process that you face. When your co-workers see your amazing shell interface, just tell them: That's Special (TM) Start your instance to see connection details.  
```
ssh -p 54457 ctf-player@saturn.picoctf.net The password is 8a707622
```

## Approach
After connecting, I tried different tons of shell syntax, but none of them seemed to work. Until accidentally, I tried using **&** operator. 
```
Special$ #bash
Why go back to an inferior shell?
Special$ $1 && ls
I i is
sh: 1: I: not found
Special$ clear & find..
Clear & find
sh: 1: Clear: not found
.
./blargh
./blargh/flag.txt
./.cache
./.cache/motd.legal-displayed
Special$ clear & cat ./blargh/flag.txt
Clear & cat ./blargh/flag.txt
sh: 1: Clear: not found
picoCTF{5p311ch3ck_15_7h3_w0r57_a60bdf40}
```

Finally, the flag:
```
picoCTF{5p311ch3ck_15_7h3_w0r57_a60bdf40}
```
