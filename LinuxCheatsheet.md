# Cheat sheet

# Misc Commands first 
```sh
<COMAND 2>/dev/null> # 2 relates to the stderr output and will redirect it to the null device 
!<CMD_HISTORY_NUMBER> # this will run a specific command from your history eg: !234
ctl+a # brings your cursor t othe begining of the command line
ctl+l # clears the terminal 
uname -a # will list all the key info about the system you are on

```

```sh
lsmod # list all drivers that are currently loaded
modinfo <NAME_OF_KERNEL_DRIVER>  # Get more info on a driver
strace <BASH_COMMAND> # will run a system call trace on and command. This can come in handy when you want to see exactly what happened and exactly what might have gone wrong with a linux command. 
strace -c <BASH_COMMAND> # This shows the counter view of the strace so you can enumerate the time, calls, errors, syscalls. Great for compareing commands.
man (7) signal # will show you the man page for all the different Linux signals
netstat -tulpen # list open ports
sudo lsof -i tcp -nP # for mac list all open tcp ports
```
#  systemctl - Control the systemd system and service manager

```sh
systemctl <tab> <tab> # lists all the commands for systemctl
systemctl list-dependencies # list the dependencies tree
systemctl daemon-reload # will update all the service files 
systemctl start <service_name>  # starts a service
systemctl show <service_name> # will list the details of a service such as Restart
```

# Groups and Users
```sh
groupadd sales # addes the group called sales
useradd -G sales Lisa # adds a user called Lisa to the group called sales
chgrp sales /data/account # sets the ownership of the /data/sales dir to the sales group
setfacl -m  d:g:sales:rx /data/sales # set file acl -m (modify)  d:g:sales:rx is default setting on all files on the group called sales 
setfacl -m  g:sales:rx /data/sales # without the d: will take care of the directory itself
getfacl <FILE_NAME> # return the access controls for a file
chown linda account # changes the ownership of the account folder to linda
chmod g+s <FILE_NAME> # applies the sticky bit to the file meaning only the owner can delete the file
chattr +i <FILE_NAME> # will make the file immutable and so unchangeable and undeletable
chattr -i <FILE_NAME> # will undo the immutable setting of a file.
  
ctl+l will clear the screen
su -   # su stands for switch user and will switch your user. If you don't supply an a user name and just the dash, it will switch you to the root account and open a login shell.
man -k <SEARCH_TERM> # will return search results for the term from all man pages 
man -k <SEARCH_TERM> | grep 8 # this will look for root user commands (because of the 8)
```
# ls (listing files)
```sh
ls # simple listing 
ls -d # just show the directory names , not their contents
ls -l # long list 
ls -a # shows all files including hidden files
ls -lrt # sorts on last modification date
ls -ld /home # lists the properties of the home directory
ls -li <FILE_NAME> # we will list the inode numbers in the listing 
```
# Wildcards ( Globbing)
```sh
* # everything
? # one signal char
[a-c] # range from a to c
ls [a-c]* # list all files that start with an a, b or c
ls ?[z-s]* # list files where the second char is anything from z up to s. 
ls *?[a-z] # any files which end in a lower case letter  
ls a?s* # return files that start with a; have any letter; then an s; and then any amount of any letter.
ls a[lm] # return files that have an l or m on the second position
```
# cp (Copy)
```sh
cp <FILE> <DESTINATION>
cp /etc/hosts .
cp -R /tmp /my
``` 
# Directory cmds
```sh
cd - # goes back to the previous directory
mkdir -p files/morefiles # -p for parents. This will make the files directory with the morefiles directory within if they don't exist already
cp <FILE_NAME>  .. # .. means one level up , so this will copy the file to the above directory 
cp ../../<FILE_NAME> # will copy it two directories up
cp ../<FILE_NAME> . # this will go up one level, look for the file and copy it to the current directory
```
# find -- find things ( Really good Man page)
```sh
find / -name "hosts" # find <SEARCH_DIR> -name <SEARCH_NAME >
mkdir /root/amy; find / -user amy -exec cp {} /root/amy \; # make a dir and copy all these files into it
find / -size +100M # look for files greater than 100 megabytes

find / type -f -size 100M # find files only that are greater than 100 megabytes
find /etc -exec grep -l Bob {} \; -exec cp {} root/Bob/ \; 2>/dev/null # find files from the etc dir that contain Bob and return the file names and then copy them to a dir /root/Bob. Any errors are sent to the null device
find /etc -name '*' -type f | xargs grep "foo" # look for files only, with any name and within those search for the string "foo". 
```



### NOTES
yum install bash-completion     // extras for tab completion 