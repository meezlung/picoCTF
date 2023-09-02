# Magikarp Ground Mission

## Overview
- **30 points**
- **General Skills**
- **Author: Syreal**

# Description
Do you know how to move between directories and read files in the shell? Start the container, `ssh` to it, and then `ls` once connected to begin. Login via `ssh` as `ctf-player` with the password, `6dee9772`

Additional details will be available after launching your challenge instance.

## Approach
First step is to launch the instance, as this challenge is launced as **NOT_RUNNING** by default. 

Once the instance is now running, the menu will prompt a SSH server. Enter this in the webshell or terminal. 
```
$ ssh ctf-player@venus.picoctf.net -p 54638
```

It will then ask you for password. Just type:
```
6dee9772
```

Once in the terminal, notice that you're connected to another device, specifically another Ubuntu device. It will then show the properties of the device you're connected to. Now, if you see the list of files **'ls'**. These will appear
```
1of3.flag.txt instructions-to-2-of-3.txt
```

Run 'cat' to both of the files.
```
$ cat 1of3.flag.txt
picoCTF{xxsh_
$ cat instructions-to-2-of-3.txt
Next, go to the root of all things, more succinctly `/`
```

As you can see, it prompted you the first part of the flag, **picoCTF{xxsh_**. Now only left thing to do is to find the other two.

Since, it said 'go to the root of all things, more succintly '/', I've been scrolling around the directories, and spammed **'cd ..'** until I go to the root directory.
```text
$ cd ..
$ ls
3of3.flag.txt drop-in
$ cat 3of3.flag.txt
540e4e79
```

Now that I have the third part of the flag, I can look for other directories as well. Continue to use **'cd ..'**
```
$ cd ..
$ ls
ctf-player
$ cd ..
$ ls
2of3.flag.txt boot etc ...
bin           dev  home ...
```
We finally we went to the '**root of all things**'. We can open the 2nd part of the flag by:
```
$ cat 2of3.flag.txt
0ut_0f_\/\/4t3r_
```

By combining the three parts, we finally arrive at the final answer.
```
picoCTF{xxsh_0ut_0f_\/\/4t3r_540e4e79}
```







