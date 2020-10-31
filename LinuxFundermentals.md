# Linux Fundamentals

RHEL - Red Hat Enterprise Linux - eg RHEL8
CentOS - Community Enterprise Operating system
Fedora - Development platform or Community Operating System, funded by Red Hat
Ubuntu - based on the debian 
Linux Mint - based on Ubuntu
SUSE - is an enterprise Linux
OEL - Oracle Enterprise Linux

# Essential Command line tools 
```sh
whoami # 
hostname # s
date # set and get the date
uname # give s you info about the system and the kernel
passwd # allows management of passwords
touch # writes empty files. Good to know if yuou have write attributes.
last # shows you who has been logged on in your system
```

```--help``` is a common command on many linux commds to get help on usage. 

On Ubuntu instead of typeing ```su -``` to open a shell as root, you sype ```sudo -i```.

# Man (manual) pages

Man pages have sections 
- 1 is for end-user commands
- 8 is for administrator (root) command
- 5 is for configuration files

```man -k user``` will search all the man pages for mention of the term user. this is handy if you want to search for a file.

cd /usr/share/doc also list info about all the packages.
Any docs that have SAG are administrator group help files.

# Linux file system 

From the root ```/``` you may have certain directories.

/bin - for binaries; eg compiled files
/home - for user home directories
/var - log files and more
/usr - program files , sbin (system binaries)
/boot - for booting up the system so often on a separate partition. IT will contain the linux kernel
/dev - this will contain the device files; which contain access to hardware.
/etc - This is where configuration files live.
/ media and /mmt 
/opt - For applications like a data base that are quite involved and complex
/proc - This is quite interesting as it is an interface to the Linux kernel, where it will list dirs related to current processes. Useful files to ```cat``` are are ```cpuinfo``` and ```meminfo```.
/sys - This is for hardware information and one of the advanced directories
/var - contains files that can be dynamically created by the OS. the most important dir in here will be the ```log``` dir that contains all the logs. Especially ```/var/log/messages``` to

Mount means you can connect a storage device to a specific directory. For example; you may want to mount the home directory to a separate disk so there is dedicated space available. 


