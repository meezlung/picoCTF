# strings it

## Overview
- **100 points**
- **General Skills**
- **Author: Sanjay C/Danny Tunitis**

## Description
Can you find the **flag** in file without running it?

## Approach
One approach is just to simply open the file in the text editor, and search the flag. 

That could be time consuming in some cases, so if we want to find it quicker, we need to use the terminal.

Open up the terminal with a UNIX environment (I used WSL in Windows). We're going to use the **"strings"** command. It is used to scan executable programs or libraries to extract and check whether there are any human-readable strings inside of that file. In this case, we input:
```
$ strings strings | grep "{"
```

This command line searches for any string that has a "{" in it and if it did, it prints out the whole string.

Finally arriving to our flag.
```
picoCTF{5tRIng5_1T_7f766a23}
```


