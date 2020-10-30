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



### NOTES

yum install bash-completion     // extras for tab completion 