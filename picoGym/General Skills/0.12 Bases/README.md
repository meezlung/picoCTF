# Bases

## Overview
- **100 points**
- **General Skills**
- **Author: Sanjay C/Danny T**

## Description
What does this **bDNhcm5fdGgzX3IwcDM1** mean? I think it has something to do with bases.

## Approach
Since it has something to do with bases, I first thought of base64 command in Linux.

In the terminal, I entered this line of code.
```
$ echo "bDNhcm5fdGgzX3IwcDM1" | base64 -d && echo
l3arn_th3_r0p35
```
So in this code, "echo" is used to display the output in the terminal/. After the "|", "base 64 -d" is used to decode the hash in base 64. "&& echo" is unnecessary as this will just output a newline. I just used it because it intercepts with my username in the terminal. But without it, you will do just fine.

Finally, combining with the flag format:
```
picoCTF{l3arn_th3_r0p35}
```


