# Cheat sheet

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


### NOTES

yum install bash-completion     // extras for tab completion 