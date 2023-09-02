# chrono

## Overview
- **100 points**
- **General Skills**
- **Author: Mubarak Mikail**

## Description
How to automate tasks to run at intervals on linux servers? Use ssh to connect to this server:

Once instance starts, it will give you the following credentials:
```
Server: saturn.picoctf.net
Port: 60765
Username: picoplayer 
Password: kZx-HVJKu8
```

## Approach
Firstly, I ssh'ed to the picoplayer by using this command line and enter the password after:
```
$ ssh picoplayer@saturn.picoctf.net -p 60765
$ picoplayer's password: kZx-HVJKu8
```

I've been messing around with commands such as **"crontab -e"**, **"export EDITOR=nano"** and **"crontab -l"**, but the system didn't seem to have a neither crontab or a text editor, so those commands are useless.

So, another approach I did was to mess around with the files. I went to the root directory and opened a bunch of files using **"ls"**, until one file intrigued me.
```
$ ls 
bin   challenge  etc   lib    lib64   media  opt   root  sbin  sys  usr
boot  dev        home  lib32  libx32  mnt    proc  run   srv   tmp  var
$ cd etc
$ ls
adduser.conf            group-         mailcap.order        rmt
alternatives            gshadow        mime.types           security
apt                     gshadow-       mke2fs.conf          selinux
bash.bashrc             gss            modules-load.d       shadow
bindresvport.blacklist  host.conf      mtab                 shadow-
binfmt.d                hostname       networkd-dispatcher  shells
ca-certificates         hosts          networks             skel
ca-certificates.conf    hosts.allow    nsswitch.conf        ssh
cloud                   hosts.deny     opt                  ssl
cron.d                  init.d         os-release           subgid
cron.daily              inputrc        pam.conf             subgid-
cron.hourly             issue          pam.d                subuid
cron.monthly            issue.net      passwd               subuid-
cron.weekly             kernel         passwd-              sudoers
crontab                 ld.so.cache    profile              sudoers.d
dbus-1                  ld.so.conf     profile.d            sysctl.conf
debconf.conf            ld.so.conf.d   python3              sysctl.d
debian_version          legal          python3.8            systemd
default                 libaudit.conf  rc0.d                terminfo
deluser.conf            localtime      rc1.d                timezone
dhcp                    login.defs     rc2.d                tmpfiles.d
dpkg                    logrotate.d    rc3.d                ucf.conf
e2scrub.conf            lsb-release    rc4.d                ufw
environment             machine-id     rc5.d                update-motd.d
fstab                   magic          rc6.d                wgetrc
gai.conf                magic.mime     rcS.d                xattr.conf
group                   mailcap        resolv.conf          xdg
```

There's one file named **"crontab"**. I opened that using **"cat"**.
```
$ cat crontab
# picoCTF{Sch3DUL7NG_T45K3_L1NUX_5b7059d0}
```
