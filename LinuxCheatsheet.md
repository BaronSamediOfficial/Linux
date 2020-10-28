# Cheat sheet

```sh
lsmod # list all drivers that are currently loaded

modinfo <NAME_OF_KERNEL_DRIVER>  # Get more info on a driver

strace <BASH_COMMAND> # will run a system call trace on and command. This can come in handy when you want to see exactly what happened and exactly what might have gone wrong with a linux command. 

strace -c <BASH_COMMAND> # This shows the counter view of the strace so you can enumerate the time, calls, errors, syscalls. Great for compareing commands.

man (7) signal # will show you the man page for all the different Linux signals

```


### NOTES

yum install bash-completion     // extras for tab completion 