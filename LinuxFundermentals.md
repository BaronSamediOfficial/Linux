# Linux Fundamentals

Some flavours of Linux ...
- RHEL - Red Hat Enterprise Linux - eg RHEL8
- CentOS - Community Enterprise Operating system
- Fedora - Development platform or Community Operating System, funded by Red Hat
- Ubuntu - based on the debian 
- Linux Mint - based on Ubuntu
- SUSE - is an enterprise Linux
- OEL - Oracle Enterprise Linux

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

# Links 

IN linux file systems there are ```hard``` links and ```symbolic``` links. Every file has a single ```inode``` where you find all the administration of a file. When you type ls -l you are getting this administrative info. From the inode you go to the ```blocks``` where the data is stored. 

A symbolic link will point to a name but if the hard link they point to are removed, the symbolic links become dead. They are useful to make sure files are available where you need them.

# Rules of hard links 
- no cross device links 
- no directories allowed

To link two files we could type something like 

```sh
ln /etc/hosts hosts
```
If we then run ```ls -li /etc/hosts hosts``` we will list the inode numbers as well and should see that they are the same.

To make a symbolic link we run ```ln -s <ABSOLUTE_FILE_PATH_NAME> <LINK_NAME>```. When we list out the files in our dir the symbolic links size will reflect the size of the data for the name only, not the size of the data it points to.  


# finding files with find


```find / -user amy``` # will find all files tat are created by amy
IF we wanted to copy all the files by a user we would need to know or create the directory for them to be copied into. We would probably need to chain a ```makdir``` command to the front first like so

```mkdir /root/amy; find / -user amy -exec cp {} /root/amy \;```

Lets pull this apart a little. \<FIRST COMMAND\>;\<SECOND COMMAND\>
\<FIRST COMMAND\> is to make the directory for the copying first. 

We then run do the 2nd command...
```find <STARTING_LOCATION> <files_of_username> <username> -exec <SINGLE_CMD> <CRITERIA> <LOCATION_TO_COPY> \ ```

```find /etc -exec <COMMANDS> \; -exec <COMMANDS> \; -exec <COMMANDS> \;``` - Notice that you can chain commands as long as the end in ```\;``` . 