# Linux


# Kernel space and the User space
There are two spaces in Linux, the user space and the System space. In order for a user to to speak to the the main elements of the System space; the kernel and hardware, they use signals and system calls via the the shell or processes that are running on the machine. 
# The Kernel

Where the Kernel comes in is to handle among other things Memory Management; Scheduling: to determine which process gets CPU attention.Like operating systems , it is responsible for handling the hardware resources of the computer.

Of the Hardware on a computer; the CPU uses RAM as an important interface for the instructions and data that are being sent from the user. The storage and the networking are points that send a receive data that the CPU uses. 

In order to address the hardware, the Kernel uses the drivers. The drivers are loaded  as a module into the kernel to allow the interface into the hardware. 

# Drivers, kernels modules and device files

In the lower layers where the hardware is, we have drivers on top for different things like Disk, Sound and the terminal interface.

 In order to reach these and other Kernel modules from the user space we use the dev sudo fle system (dev for device). For example the disk is addressed through```/dev/sda```.

From a list out of contents 
```crw-rw-rw-  1 root root     10, 229 Oct 25 06:24 fuse```
in the /dev/ dir we can see attributes can either be BLOCK or CHARACTER devices as seen by the b or C at the beginning of the file description. A block is used to store blocks of data; and a character is for streams such as a disk and serial ports respectively.  

# The Shell

 Is a command interpreter that works with its own set of internal commands and acts as a user interface where users can run their commands. 

 From the point of view of the process you can see what the kernel is doing by cd-ing into the proc dir and ls on the contents too see each processes PID subdirectory. 

## Linux and C

# glibc 

 This is the GNU C library. It is the most common library on Linux. But a lightweight version exists for embedded Linux implementations.

# Written in C

Linux is written in C, a low level programming language. You can clone the coreutils from gnu.org useing git and explore the source code of Linux for yourself.

```
git clone https://github.com/coreutils/coreutils.git
```
Once you have downloaded the coreutils repo , you will find a src directory which is the source files for all the commands for hte coreutils of Linux. 

Usr/share/doc is a useful resource to find thing's like SAG's and other instructive guides about the different tools on Linux.

gcc is the GNU C Compiler that is NOT installed by default. Linux commands for gcc can go as ```gcc first.c -o first```. this will take the code of first and output a binary of first. 

More complicated programs may beed to do things like pull in external files . These would make the compiler command line very long and complicated. to fix this issue ou can use Makefiles. These are recipe files that define exactly what needs to be done in the compilation process. USe the ```make``` command to process instructions in a Makefile.