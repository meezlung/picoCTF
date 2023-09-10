# useless

## Overview
- **100 points**
- **General Skills**
- **Author: Loic Shema**

## Description
There's an interesting script in the user's home directory

Additional details will be available after launching your challenge instance.

Instance:
Hostname: saturn.picoctf.net
Port:     63295
Username: picoplayer
Password: password

## Approach
After connecting to SSH,
```
$ ssh picoplayer@saturn.picoctf.net -p 63295
picoplayer's password: password
```

the first approach was to fiddle with the "useless" script.
```
$ ls
useless
$ ./useless
Read the code first.
cat useless
#!/bin/bash
# Basic mathematical operations via command-line arguments

if [ $# != 3 ]
then
  echo "Read the code first"
else
        if [[ "$1" == "add" ]]
        then
          sum=$(( $2 + $3 ))
          echo "The Sum is: $sum"

        elif [[ "$1" == "sub" ]]
        then
          sub=$(( $2 - $3 ))
          echo "The Substract is: $sub"

        elif [[ "$1" == "div" ]]
        then
          div=$(( $2 / $3 ))
          echo "The quotient is: $div"

        elif [[ "$1" == "mul" ]]
        then
          mul=$(( $2 * $3 ))
          echo "The product is: $mul"

        else
          echo "Read the manual"

        fi
fi
```

After seeing, "echo Read the manual", I remember there is one code that shows the manual of every function and commands in Linux: **"man"**.
```
$ man man
MAN(1)                        Manual pager utils                        MAN(1)

NAME
       man - an interface to the system reference manuals

SYNOPSIS
       man [man options] [[section] page ...] ...
       man -k [apropos options] regexp ...
       man -K [man options] [section] term ...
       man -f [whatis options] page ...
       man -l [man options] file ...
       man -w|-W [man options] page ...

DESCRIPTION
       man  is  the system's manual pager.  Each page argument given to man is
       normally the name of a program, utility or function.  The  manual  page
       associated with each of these arguments is then found and displayed.  A
       section, if provided, will direct man to look only in that  section  of
       the  manual.   The  default action is to search in all of the available
       sections following a pre-defined order (see DEFAULTS), and to show only
       the first page found, even if page exists in several sections.
```

And so, I tried different synopsis.
```
$ man -f useless
useless: nothing appropriate
$ man -K useless
useless
     useless, -- This is a simple calculator script

SYNOPSIS
     useless, [add sub mul div] number1 number2

DESCRIPTION
     Use the useless, macro to make simple calulations like addition,subtrac-
     tion, multiplication and division.

Examples
     ./useless add 1 2
       This will add 1 and 2 and return 3

     ./useless mul 2 3
       This will return 6 as a product of 2 and 3

     ./useless div 6 3
       This will return 2 as a quotient of 6 and 3

     ./useless sub 6 5
       This will return 1 as a remainder of substraction of 5 from 6

Authors
     This script was designed and developed by Cylab Africa

     picoCTF{us3l3ss_ch4ll3ng3_3xpl0it3d_4151}

--Man-- next: dbus-cleanup-sockets(1) [ view (return) | skip (Ctrl-D) | quit (Ctrl-C) ]

DBUS-CLEANUP-SOCKE(1)            User Commands           DBUS-CLEANUP-SOCKE(1)

NAME
       dbus-cleanup-sockets - clean up leftover sockets in a directory

SYNOPSIS
       dbus-cleanup-sockets [DIRECTORY]

DESCRIPTION
       The dbus-cleanup-sockets command cleans up unused D-Bus connection
       sockets. See http://www.freedesktop.org/software/dbus/ for more
       information about the big picture.

       If given no arguments, dbus-cleanup-sockets cleans up sockets in the
       standard default socket directory for the per-user-login-session
       message bus; this is usually /tmp. Optionally, you can pass a different
       directory on the command line.

       On Linux, this program is essentially useless, because D-Bus defaults
       to using "abstract sockets" that exist only in memory and don't have a
       corresponding file in /tmp.

       On most other flavors of UNIX, it's possible for the socket files to
--More--client_loop: send disconnect: Connection reset by peer
```

Finally, the flag:
```
picoCTF{us3l3ss_ch4ll3ng3_3xpl0it3d_4151}
```
