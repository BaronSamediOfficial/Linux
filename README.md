# Linux

### Kernel space and the User space
There are two spaces in Linux, the user space and the System space. In order for a user to to speak to the the main elements of the System space; the kernel and hardware, they use signals and system calls via the the shell or processes that are running on the machine. 

### The Kernel

kernel is a modernization of cyrnel (Old English, meaning seed).

A kernel in the Linux context is something from which the rest grows.
Where the Kernel comes in is to handle access to the Hardware. Among other things Memory Management; Scheduling: to determine which process gets CPU attention or Network configuration. Like operating systems , it is responsible for handling the hardware resources of the computer.

Of the Hardware on a computer; the CPU uses RAM as an important interface for the instructions and data that are being sent from the user. The storage and the networking are points that send a receive data that the CPU uses. 

In order to address the hardware, the Kernel uses the drivers. The drivers are loaded  as a module into the kernel to allow the interface into the hardware. 

### Drivers, kernels modules and device files

In the lower layers where the hardware is, we have drivers on top for different things like Disk, Sound and the terminal interface.

In order to reach these and other Kernel modules from the user space we use the dev sudo fle system (dev for device). For example the disk is addressed through```/dev/sda```.

From a list out of contents 
```crw-rw-rw-  1 root root     10, 229 Oct 25 06:24 fuse```
in the /dev/ dir we can see attributes can either be BLOCK or CHARACTER devices as seen by the b or C at the beginning of the file description. A block is used to store blocks of data; and a character is for streams such as a disk and serial ports respectively.  

### The Shell

Is a command interpreter that works with its own set of internal commands and acts as a user interface where users can run their commands. 

From the point of view of the process you can see what the kernel is doing by cd-ing into the proc dir and ls on the contents too see each processes PID subdirectory. 

### Linux and C

Linux is written in C, a low level programming language.
This is the GNU C library. It is the most common library on Linux. But a lightweight version exists for embedded Linux implementations.

You can clone the coreutils from gnu.org using git and explore the source code of Linux for yourself.
```
git clone https://github.com/coreutils/coreutils.git
```
Once you have downloaded the coreutils repo , you will find a src directory which is the source files for all the commands for hte coreutils of Linux. 

Usr/share/doc is a useful resource to find thing's like SAG's and other instructive guides about the different tools on Linux.

gcc is the GNU C Compiler that is NOT installed by default. Linux commands for gcc can go as ```gcc first.c -o first```. this will take the code of first and output a binary of first. 

More complicated programs  may beed to do things like pull in external files . These would make the compiler command line very long and complicated. to fix this issue ou can use Makefiles. These are recipe files that define exactly what needs to be done in the compilation process. USe the ```make``` command to process instructions in a Makefile.

Source code is complied into Object files which are linked to libraries that compose the executable program. Header files are additional source files that contain type and library function declarations.

### what happens when you run a Shell command
Takeing ```cat /etc/hosts``` as an example a few things need to happen for that to be executed. 
- The cat command need to be read and loaded from disk in RAM
- Related libraries must be found and loaded in RAM
- The /etc/hosts file needs to be located on disk
- Permissions of the current user need to be checked on this file
- If that is appropriate, the file contents can be copied to RAM

Processes cannot access the kernel directly. System calls are instead used as an interface for process to the kernel. Think of them opening a door between 'User Space' and 'Kernel Space'. You can read by typeing ```man 2 intro```. glibc provides a library interface to use system calls from programs. fork() and exec() system calls determine how a process starts
- fork(): the kernel creates an almost identical copy of the current process and replaces that
- exec(): the kernel starts a program, which replaced the current process.

Where as System calls are provided by the kernel to give access to restricted parts, Library calls come from shared libraries and provide functionality. Library call info can be found by typing ```man 3 intro```.  

To find exactly what is happening when a command is run on Linux you can use ```strace``` to explore all of the system calls that are made. For example ```strace ls -la``` will run strace and return a lot back of what went on.  If you read the out put carefully , you can see exactly what the command is doing and what does go wong , if so. This is a good way to find out when a command give your something you don't want back. 
Its important to note that strace produces stderr, so if you want to run a grep on strace output , make sure you use the right output. For example to find open files ; instead of  ```strace ls | grep open``` we need ```strace ls 2>&1 | grep open```.

```ltrace``` is similar but is for library information, It too outputs to stderr. Even thought it is for libraries, It is still useful for problem solving on Linux. 

### Understanding Signals

In Linux a signal provides a software interrupt. its a method to tell a process that its has to do something, like terminating. Signals are strictly defined, see te ```man (7) signal``` for more a complete overview
Some signals (such as sigkill ) cannot be ignores , others can be. Many signals are specific to a command.

# Linux boot procedure
At a high level ,from the moment you switch the on the power to the computer, 
- The firmware ```UEFI/BIOS``` starts looking for a bootable disk. 
- Whatever this bootable disk is (thumb drive etc) , it will need to contain a boot loader. The default bootloader on linux is ```GRUB2```. 
- The task of this bootloader is to load the operating systems, which means it will start the ```kernel```. 
- The kernel requires drivers to be present right from the bootprocess so a file system is loaded that has enough to get this done. This file system is called the ```initRAMfs```. This filesystem has been compiled to contain some root file system and some drivers. 
- Once these are loaded, ```init``` can be loaded. 
- On Modern Linux systems init is redirected to the ```systemd``` service manager. systemd will start everything , system prerequisites , services and a shell. 

### The Unified Extensible Firmware Interface(UEFI) and the Basic Input Output System(BIOS)

BIOS and EFI are interfaces offered on a PC platform to access disks and all the firmware thats needed to access the hardware on the computer. 

UEFI and EFI (non-Unified) were introduced to replace BIOS which was introduced in 1981 and not seen major changes since. Both BIOS and UEFI were developed to provide a platform that sits between hardware/firmware and the operating system. UEFI is becoming more popular on modern PCs so as it offers several advantages. The main advantage being its ability to boot from large disks when a GUID (Global Unique ID) Partition Table aka a (GPT) is used. This GPT is mainly on a UEFI system default. 

When the bootloader is initiated, it will have no drivers to load data from memory. The way in which the bootloader loads the kernel from disk, is provided via the firmware Liner Block access (LBA), which is a slow but uniform method o access disks. Most bootloaders have minimal filesystem knowledge, allowing then t read the kernel file from disk.  

### Booting from the UEFI or BIOS disks

On a BIOS system, the Master Boot Record (MBR) is read from disk and the stage 1 boot loader is activated.
The stage 1 boot loader is only 446 bytes and its task is to load the larger stage 2 boot loader that resides in the first MB of the disk.
The GPT partition table contains an EFI System PArtition (ESP) which contains a directory with the name ```efi```. In this directory, each boot loader has its own identifier and corresponding sub directory eg; /efi/microsoft or /efi/grub. The boot loader itself has the .efi extension and resides in these subdirectories, along with its supporting file. SO the big difference between BIOS and UEFI is that BIOS will find its files within a areas that is not within a file system. For the BIOS they will be in the MBR and metaData area of the hard disk. On EFI you will find everything in the EFI system partition. On a UEFI system, a GPT partition table is always used; an MBR is maintained for backwards compatibility.

 Running the command ```gdisk /dev/sda``` we can see the different partitions. Pressing option ```p``` will show us info about the different partitions.

 If we run ```mount | grep sda``` we can see the directories where the efi dirs are kept for the boot disks. These will contain the boot and the OS files. 


### The Bootloader

The bootloader is responsible for loading the OS kernel, normally Linux but this could be windows or something else. It also provides options to select a kernel fro ma boot menu, or pass kernel parameters to influence the start. There are different bootloaders. GRUB2 ia the most common there is GRUB. SYSLINUX is a bootloader common in PXE boot. LILO was a default boot loader up to the year 2000.

The way the bootloader 

BIOS or UEFI needs to look up the boot device. Once it has been found, it needs to find the boot code. This depends on if you are using BIOS or UEFI, This will wither use MBR or ESP respectively. Once we have found it we can load GRUB stage 1. This is where GRUB can access the disk. Grub will look for a boot partition. Once this is done GRUB loads. We then get the GRUB modules. After this we load the grub prompt. The user can add there options. The Kernel and initRAMfs can be loaded and then we can continue. 
