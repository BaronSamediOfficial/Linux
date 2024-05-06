# Linux Fundamentals

Some flavours of Linux ...
- RHEL - Red Hat Enterprise Linux - eg RHEL8
- CentOS - Community Enterprise Operating system
- Fedora - Development platform or Community Operating System, funded by Red Hat
- Ubuntu - based on the debian 
- Linux Mint - based on Ubuntu
- SUSE - is an enterprise Linux
- OEL - Oracle Enterprise Linux

# Linux File system
Defined by the `Filesystem Hierarchy Standard` FHS 3.


```sh
/bin            # Binaries or executables are essential to the entire operating system, eg curl

/boot           # contains the linux kernel and some boot configuration, also the grub folder. 

/dev            # Dev stands for device files. You can interface with hardware or drivers as if they were regular files; Create disk partitions here too.

/sbin           # System binaries and executables that should only be executed by the root user or sys admins

/lib            # Libraries are stored in here that could be used by things including binaries

/usr            # Like a mini Linux file system. Among other things can contain non-essential binary files stored in its own /bin or /sbin directories
/usr/local/bin  # Contains binaries that the user may have compiled manually 

# All binaries above get map together with the $PATH environment variable. Hence why you can execute them from any directory in the terminal. 

/etc            # stands for "Editable Text Configuration" And mainly contains configuration files that end in ".conf"

/home           # Contains a directory named after each use on the system. These contain the files, configuration and software for each user.
                # To modify these you need to be logged in as that user or the root user
/mnt            # Place to mount various file systems. This is where you would mount a new hardrive , simpler in windows.

/opt            # Contains optional add-on software that you really interact with this 

/var            # Contains variable files that will change as the operating system is being used such as logs and cache files

/tmp            # For temporary files that will not be persisted between reboots 

/proc           # Illusionary file system to keep track of running processes. It is stored in memory and created on the fly by the Linux kernel. A folder for every process on the system.

/root           # This is the home directory for the root user. Not to be confused with the root directory "/".
```

# Essential Command line tools 
```sh
whoami # 
hostname # s
date # set and get the date
uname # give s you info about the system and the kernel
passwd # allows management of passwords
touch # writes empty files. Good to know if you have write attributes.
last # shows you who has been logged on in your system
```

```--help``` is a common command on many linux commands to get help on usage. 

On Ubuntu instead of typeing ```su -``` to open a shell as root, you type ```sudo -i```.
`su` == substitue user
`sudo`



# Man (manual) pages

Man pages have sections 
- 1   Executable programs or shell commands
- 2   System calls (functions provided by the kernel)
- 3   Library calls (functions within program libraries)
- 4   Special files (usually found in /dev)
- 5   File formats and conventions, e.g. /etc/passwd
- 6   Games
- 7   Miscellaneous (including macro packages and conventions), e.g. man(7), gro(7), - man-pages(7)
- 8   System administration commands (usually only for root       
- 9   Kernel routines [Non standard]

- `Synopsis` 
  - bold text : type exactly as shown
  - italic : agrumants which are replacable
  - `...` means the command can be repeated

```man -k user``` will search all the man pages for mention of the term `user`. this is handy if you want to search for a file.
- `man ....`
  - `-t     # format for printing`
  - `-f     # Just showq comnd description`
  - `-D     # Show debugging information`
  - `-h     # show help options`

`cd /usr/share/doc` also list info about all the packages.
Any docs that have SAG are administrator group help files.

## [Apropos](http://www.linfo.org/apropos.html)
With the `apropos` command, we can search the list of man page descriptions for a possible match based on a keyword.
```
apropos <SEARCH_TERM>       # search for the term in all the man pages
```
### Other info commmadns
`whatis` 
`info`
`-h`
`--help`

Also the site: https://tldp.org


# Linux file system 

A **file system** is a data structure used by an operating system to store, retrieve, organize, and manage files and directories on storage devices.

On Linux from the root ```/``` you may have certain directories.

`/bin` - for binaries; eg compiled files
`/home` - for user home directories
`/var` - log files and more
`/usr` - program files , sbin (system binaries)
`/boot` - for booting up the system so often on a separate partition. IT will contain the linux kernel
`/dev` - this will contain the device files; which contain access to hardware.
`/etc` - This is where configuration files live.
`/media` and `/mmt` 
`/opt` - For applications like a data base that are quite involved and complex
`/proc` - This is quite interesting as it is an interface to the Linux kernel, where it will list dirs related to current processes. Useful files to ```cat``` are are ```cpuinfo``` and ```meminfo```.
`/sys` - This is for hardware information and one of the advanced directories
`/var` - Contains files that can be dynamically created by the OS. the most important dir in here will be the ```log``` dir that contains all the logs. Especially ```/var/log/messages``` to

Mount means you can connect a storage device to a specific directory. For example; you may want to mount the home directory to a separate disk so there is dedicated space available. 

Linux support other file systems includeing 
- `FAT`
- `ext2`
- `ext3` Faster  
- `ext4` Support large volumes and files up to 16tb
- `XFS` HP fast recvery and large files, 
- `BTRFS` - most advanced for vulomes and repair


Some file systems act as network protocols as well eg `smb`
- `CIFS` is an implentation as smbv1 but smbv2/3 worked out so this is not reall used 
- `NFS` ( Network File system) is not compatible with smb . It has better features than smb . This is ok if you are only doing linux only , **but if you are doing windows and Linux in your system you will need to use smb**

- `Index node` - stores meta data about a file or dir non a file system.
- `VFS` (Virtual file system) will be betwee nthe kernel and file system


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
IF we wanted to copy all the files by a user we would need to know or create the directory for them to be copied into. We would probably need to chain a ```mkdir``` command to the front first like so

```mkdir /root/amy; find / -user amy -exec cp {} /root/amy \;```

Lets pull this apart a little. \<FIRST COMMAND\>;\<SECOND COMMAND\>
\<FIRST COMMAND\> is to make the directory for the copying first. 

We then run do the 2nd command...
```find <STARTING_LOCATION> <files_of_username> <username> -exec <SINGLE_CMD> <CRITERIA> <LOCATION_TO_COPY> \ ```

```find /etc -exec <COMMANDS> \; -exec <COMMANDS> \; -exec <COMMANDS> \;``` - Notice that you can chain commands as long as the end in ```\;``` . 

# tar (tape archiver) 
```tar``` was created a long time ago to stream files to a back-up tape. The basic use is to put files together in one archive; with the option to compress the data.  

Basic usage to archive is something like 
```tar -cvf <NAME_OF_CONTENTS> <CONTENTS_TO_BACKUP>``` (create , verbose , file to create , contents TO THE CURRENT DIRECTORY)
```tar -cvf <NAME_OF_CONTENTS> -C <NAME_TO_BACKUP_TO>``` (create , verbose , file to create , Location to store)
and then to extract
```tar -xvf <NAME_OF_CONTENTS>``` (extract , verbose , file to extract TO THE CURRENT DIRECTORY)
```tar -tvf <NAME_OF_CONTENTS> <NAME_TO_BACKUP_TO>``` (inspect contents only, verbose , file)
Compression can be added with either ```-z (gzip)``` to ```-j (bzip2)``` as the compression utility.
```tar -tzvf <NAME_OF_CONTENTS> <NAME_TO_BACKUP_TO>``` this will compress the archive down with gzip. FYI - There is marginal saving between the two compression types.

# file Compression 

gzip is the most common compression utility that is also support by Windows and MAc utilities
bzip2 had a better algorithm but maybe not much andymore
zip this is windows compatible syntax which his nice

## Understanding Regular Expressions

Regular Expressions or RegEx (pronounced Regg-ex) are text patterns that are used by tools like grep and others, but don't confuse them with globbing. They look similar but are not the same.

RegEx expression are built around _atoms_; an atom specifies what text is to be matched. Atoms can be single chars, a range of chars or a dot if you don't know what use. Atoms can also be a class such as 
- [[:alpha:]]
- [[:upper:]]
- [[:alnum:]]

The second element in a RegEx is the repetition operator, which specifies how many times a char should occur.
The third element is indicating where to find the next char. 
```
 ^         beginning of the line
 $         end of the line
 \<        beginning of a word
 \>        end of a word
 A         start of a file
 Z         end of a file
 {n}       exact n times -- {} is the repetition operator
 {n,}      minimal n times
 {,n}      n times max
 {n,o}     between n and o times
 *         zero or more times
 +         one or more times
 ?         zero or one times       
```

Its always advised to put your regular expression between single quotes because it will really make a difference.

The ```egrep``` command (eg; ```egrep 'ab{2}c' myfile``` ) is shortcut for grep binary, but with one exception, when ```grep``` is invoked as egrep the grep binary activates its internal logic as it would be called as ```grep -E``` . The difference is that ```-E``` option enables usage of extended regexp patterns. It will allow you using of such meta-symbols as + , ? or |

For use with specific tools only ( grep, vim, awk, sed). See the ```man 7 regex``` for details. 

### Common text processing utilities
- cut : filter output from a text file
- sort : often used in pipes
- tr : translates uppercase to lowercase
- awk : search for specific patterns 
- sed : powerful stream editor to batch-modify text files.

# USers and Groups

3 types of account
- root
  -  more powerful than a windpows Administrator
  -  Do not login as this user, 
- standard
- services
  -  Run and the background and do a single function
  
USers are added ot the `/etc/sudoers` file
use the `sudoersedit` cmd you must make a 
oly use the `visudoers` comand so it can verifiers the syntax
`-c` check fpor errors
`-f` check a file in one other than the default 
`-s` check in strict mode
`-x` output the file in json 


Polkit (Policykit) Controls the provleges that allow non provelged user with `pkexec` -0 Not as good secutity as `sudo`

#### Add new users 
```
# useradd [options] [username]
# options in the /etc/login.defs fiel
# home dir of a new user is populated with the files set at /etc/skel ( skeleton directory)

useradd testadmin   # add a new user
-c # Common field
-e # expiery date
-s # sets the default shell
-D # View defaukt settings 
passwd testadmin    # set there passwd by following the prompts 

```

```
└─# sudo useradd -D
GROUP=100
HOME=/home
INACTIVE=-1 # no inactivity limit after the passwd has expierd
EXPIRE=
SHELL=/bin/sh
SKEL=/etc/skel   # copy all the files from here to the new user home dir
CREATE_MAIL_SPOOL=no  # indcates if a mail spool which will be created
LOG_INIT=yes
```

Example of a user add

```
sudo useradd -e 12025/12/31 -c "rishard Stanley" rstanly

# then change the expirey date (Change Age )
sudo chage -E 2022/12/31 rstanly 

# change a users name
sudo usermod -l restanlynew rstanly


# lock a use acount (apparently)
└─# sudo passwd -l restanlynew
passwd: password changed.


# unlock a use acount (apparently)
└─# sudo passwd -u restanlynew
passwd: password changed.

└─# sudo chage -l manderson 
Last password change                                    : Apr 23, 2024
Password expires                                        : never
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 0
Maximum number of days between password change          : 99999
Number of days of warning before password expires       : 7

```

#### delete a user 

```
sudo userdel USERNAME       # This WONT delete the directory in Home
sudo userdel -r USERNAME    # This WILL DELTE THE HOME DIRECTORY
```


#### /etc/passwd

This file used to be called `/etc/password` but it was todangerous. Now, each feild is seprated by 7 colons `:` 
These values are:
- `Username`
- `Password` Represented only by an X else itws insecure
- `UserID`
- `GroupID`
- `Comments`
- `HomeDir`
- `LoginShell`
Proper editing of this file is best done through: `useradd` `usermod` or `userdel` commands

`/etc/shadow` is te file where the password hashes, includeing hte expiery and other info. Only availible to the root user. The 7 feilds of this file are
- `USername`
- `Password hash`
- `Days since password was changed`
- `Days before change is required`
- `Days until user is warned to change`
- `Days after password expiry when the account gets disablked`
- `Days account has been disabled`
- `Unused felid for future use`

#### Add users to the sudoers
```

useradd testadmin   # add a new user
passwd testadmin    # set there passwd by following the prompts 

visudo   # opens a nano prompt top edit the sudoers file `/etc/

# scroll to the bottom of the file and add something like 
testadmin ALL=(ALL) NOPASSWD:ALL   # but this is quite relaxed and should not be used NOPASSWD!!!

```
### Root why is it so powerful?

If we draw a line between ```user land``` and ```kernel land```; to get from user land as user Alice, you would need to traverse the Syscalls and permissions that are set for Alice and the objects and subjects she would like ot access within user land. The root user lives in the kernel land so they don't need to worry about traversing the syscalls and permissions; even files that don't have any permissions : root can access them all. 

A convention in Linux is that the terminal for a normal user will look like 

```Bob@myMachine:~$ ```

instead of

```root@myMachine:~# ```

Can you see the difference? thats right. the dollar sign $ for regular users and hash sign # for the out, This convention also carries within documentation so look out for it. 



## The Shell
The shell can be thought of as a interpreter between humans and the operating system. 

Redirection in the shell is used to manipulate  input and output of commands
- Standard input (0) : \<
    + sort \< /etc/services 
- Standard output (1) : \>
    + ls \> ~/myfile        # creates a new file
    + whoami \>\> ~/myfile  # appends to the existing file
- Standard Error (2): 2\> 
    + grep -R root /proc 2>/dev/null         # this sends the errors to the null device ( nowhere)
    + grep -R root /etc &> ~/myfile         # this sends errors and all

### restart types
- `shutdown -h now      # halt ( hard )` 
- `shutdown -r now      # restart`


## Piping
A pipe ```|``` is used to send the output of one command to be used as input for the next command.
- ps aux " grep http

The tee command combines redirection and piping; It allows you to write output to somewhere, and at the same time, use it as input for another command.
- ps aux | tee \<FILE_NAME\> | grep ssh 

## bash-completion
installing the ```bash-completion``` package is really useful. Pressing Tab-Tab mid way through most commands with it installed with present you with all the possible options. Check it out

## Variables in Linux
A variable is a label to which a dynamic value can be assigned.  In Linux they are convenient for scriptin because you can define the variable once and then use it in a flexible way in different environments. 

- System variables contain default settings used by linux
- Environment variables can be set for application use
    + Use ```varname=value``` to define.
    + Use ```echo $value``` to read.

- By Default, variables are only known to the current shell
    + Use export to export it to all subshells 
    + for added permanence eadd it to the ```.bash_rc``` file so it persists on every terminal you open.
### PATH
One of the most commonly-referenced environment variables is `PATH`, which is a colon-separated list of directory paths that Bash will search through whenever a command is run without a full path.






## Bash start up files 
The important start up files for bash are 
- ```/etc/environment``` contains a list of variables and is the first file that is processed while starting bash (empty by default on Red Hat).
- ```/etc/profile``` is executed while users login. Offers system wide env vars. This file is read very early in the boot.
    + ```/etc/profile.d``` is used as a snapin directory that contains additional configuration and system wide variables

    + ```/.bash_logout``` is processed when a user logs out


### Profile files
+ A system wide ```/etc/bashrc``` is a processed every time a subshell is started . it enables customization fo a users environment . Alias are a popular use here. 
    + A user-specific ```~/.bashrc``` file may ne used. 
    + ```/.bash_profile``` can be used as a user-specific version. Shell configuration for ALL shells. Think of this as part of the `skel` settings.

## Working with Users and groups
groupadd (create groups)

adduser (Ubuntu) & useradd (Centos)

```sh
adduser  bob                # add bob as a user (UBUNTU only)
usermod --help              # Lots of options including locking and unlocking accounts
usermod -a anna -G foo      # add alice to the foo account
groupadd <GROUP_NAME>
userdel bob                 # delete bob as a user
useradd - D                 # displays the default setting for new user adds
/etc/skell                  # Contents is copied to use home directory upon user creation
/etc/login.defs             # used as the default configuration so changing this file will change the defaults. Such as password length, GRoup id, home dir
passwd -l <USER>            # Locks the password
passwd -u <USER>            # UNLOCKS the password
passwd -S <USER>            # Returns the status of the password
chage <USER>                # will load up the process to set password lifetime settings - Useful for admins
```

There are four files for configuring centralised group and user information
- `/etc/shadow`
- `/etc/group`
- `/etc/gshadow`
- `/etc/passwd`

`/etc/passwd` - this is historically the file tha Unix has used to store user information. As this file is normally set to read for all users, the passwords are no longer stored in here. Instead they are encrypted and stored in hte `/etc/shadow`. Groups are stored in `/etc/group` . `/etc/gshadow` is not used anymore but it is a legacy file to set passwords for groups. You can modify the users and groups the safest way is to use `vipw` which will open a temporary file of `/etc/passwd` in VI. This will prevent cases where other users aer in `useradd`. OT do the same for `/etc/shadow`, use `vipw -s`. `vigr` will let you edit groups.


## Working with Groups
Create groups
- `groupadd [options] {group name}`
```
sudo groupadd FinanceDept
sudo groupmod -n GraphicsDept Graphics

```
Modify groups

- `groupmod`
Ad a user `eht` to the group `GraphicDept`
```
sudo usermod -aG GraphicsDept eht

```
- `groupdel`

**Delete group** - Deleting a group will not delete the members of a group
```
sudo groupdel GraphicsDept
```
### Query users and groups
`whoami` - displays the current username

root user will have `#` , all other users will have `$`

```
└─# who                       
eht      tty7         Apr 21 17:34 (:0)

└─# w     
 14:07:14 up  5:07,  1 user,  load average: 0.01, 0.02, 0.00
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
eht               -                Sun17   44:32m  0.00s  0.04s lightdm --session-child 13 24
```

`last` command display the history of the login and logout actions

```
└─# last    
eht      tty7         :0               Sun Apr 21 17:34    gone - no logout
reboot   system boot  6.5.0-kali3-arm6 Sun Apr 21 17:34   still running
eht      tty7         :0               Sun Apr 21 16:03 - 16:33  (00:30)
reboot   system boot  6.5.0-kali3-arm6 Sun Apr 21 17:02 - 16:34  (-00:28)
eht      tty7         :0               Fri Mar 15 15:25 - 17:48 (33+01:23)
reboot   system boot  6.5.0-kali3-arm6 Fri Mar 15 15:25 - 17:48 (33+01:23)
eht      tty7         :0               Wed Feb 21 09:30 - 10:01  (00:31)
...
...
```


### Working with Profiles




### Session management 
`Loginctl`allows for current session management.
```sh
loginctl <tab> <tab>                        # get all the options.
loginctl list-sessions
loginctl show-session <session-id>          # will show whats been going on with a user such as files open etc. 
loginctl show-user <username>
loginctl terminate-session <session-id>
```

## Basic Permissions

File permissions can be views with the `ls -l` command. The view is structured as followed
There are 7 columns, 3 of which refer to Permissions

```sh
<PERMISSION_STRING> <Number of Links> <OWNER> <GROUPS>  <SIZE_Bytes> <LAST_MODIFIED> <FILE_NAME>
-rw-r--r--    1                 root    root       5551         Feb 21 09:10    .bashrc
...
...
-rw-r--r--  1 root root  5551 Feb 21 09:10 .bashrc
-rw-r--r--  1 root root   571 Feb 21 09:10 .bashrc.original
```


```sh
└─# ls -la
total 76
drwx------  6 root root  4096 Apr 23 14:10 .
drwxr-xr-x 19 root root  4096 Feb 21 09:10 ..
-rw-r--r--  1 root root  5551 Feb 21 09:10 .bashrc
-rw-r--r--  1 root root   571 Feb 21 09:10 .bashrc.original
drwx------  3 root root  4096 Feb 21 09:32 .cache
drwx------  2 root root  4096 Feb 21 09:05 .ssh
-rw-------  1 root root  2111 Apr 22 19:57 .viminfo
-rw-------  1 root root   679 Apr 23 13:29 .zsh_history
-rw-r--r--  1 root root 10868 Feb 21 09:10 .zshrc
```

### Permission String

A permission string might look like `drwxr-xr-x` of 11 chars
Char 1 == Directory `d` or file `-` 
Char 2-4 == Owner Permissions
Char 5-7 == Group Permissions
Char 8-10 == Other Permissions
Char 11 == Access Method SElinux `.` or Alternative Acces `+`

Some examples and explanations ...

|  Number      |      Permission Type          |    Symbol |   |   |
|:------------:|:-----------------------------:|:---------:|---|---|
|   0          |     No Permission             |     —--     |   |   |
|   1          |     Execute                   |     –x-    |   |   |
|   2          |     Write                     |     -w-   |   |   |
|   3          |     Execute + Write           |     -wx   |   |   |
|   4          |     Read                      |     r–-   |   |   |
|   5          |     Read + Execute            |     r-x  |   |   |
|   6          |     Read + Write              |     rw-   |   |   |
|   7          |     Read + Write + Execute    |     rwx   |   |   |

To work with permissions is about ownership. Permissions are assigned UGO (Users,Groups, others). `chown` is used for the user owner. `chgrp` is used for changing the group owner. If you don't change ownership then the user who created the file will be the user owner and the primary user of that group will become group owner. 

The permission mode is where you define which permission will me applied to yor files. This is done with an Octal number system where he base is 8 as apposed to our common 10.
`chmod` is used for change the mode of a file. `chmod` can used in an absolute way and a relative way such as `chmod 761`. Each of these digits will be a derivation of the base 8 numbering to control the file permissions. Eac hpermissions fo `read`, `write` and `execute` has been associated a number; which we add up to give one of the three digits for our permissions.

`4` == read 
`2` == write 
`1` == execute

so `4 + 2 + 1 == 7` so we could have a `x7x` or `7xx` which would mean the user has full access or the group has full access respectively.
Read and write would be `4 + 2 == 6`.

Lets break that command down

| example UGO permissions | user | group | others |   |
|-------------------------|------|-------|--------|---|
| chmod                   | 7    | 6     | 1      |   |
|                         |      |       |        |   |
|                         |      |       |        |   |
 
 So above we would be assigning 
 - user to `Read + Write + Execute `
 - group to `Read + Write`
 - others to `Execute`

 ```sh
 chown <user>:<Group_name> <Directory>
 chown alice:foo bar/                   # add alice of the foo group to the bar directory

 ```
 ## Special Permissions 
 These were invented to solve a few problems that occurred with the first distributions of Linux. 

 |            | files | directories |
|------------|-------|-------------|
| SUID       |  Run as owner     |   `<n/a>`          |
| SGID       |    Run as group owner   |   Inherit the directory group owner          |
| Sticky bit |    `<n/a>`  |      only delete if you are owner       | 

```sh
└─# ls -la
total 76
drwx------  6 root root  4096 Apr 23 14:10 .
drwxr-xr-x 19 root root  4096 Feb 21 09:10 ..
-rw-r--r--  1 root root  5551 Feb 21 09:10 fileA.txt
-rw-r--r--  1 root root   571 Feb 21 09:10 fileB.txt
```

In order to assign special permissions we can use chmod by adding a 4th digit to the left hand side of the regular permission commands for example

| example UGO permissions | special | user | group | others|
|-------------------------|------|-------|--------|---|
| chmod                   | 4/2/1   | 7    | 6     | 1      |
|                         |      |       |        |   |


### Add SUID to a file
- **Symbolic Mode** : `chmod u+s fileA.txt`
- **Absolute Mode** : `chmod 4### fileA.txt`

### Add SGID to a file
- **Symbolic Mode** : `chmod g+s fileA.txt`
- **Absolute Mode** : `chmod 2### fileA.txt`

You can set the Set User ID with `chmod u+s <file>`
Give the group write permissions `chmod g+w DirA`
Give the other read and write permissions `chmod o+rw file1`
Give the user execute permissions `chmod u+x file1`

To find files that have the `SUID, SGID or sticky bit` set you can use the following command which will look for permissions that have 4 digits , 3 of which don't matter, just the one on the left which is set to X atm.
      ```
      find / -perm /X000
      ```

### Sticky bit

**If sticky is applied, it will add protections to files within a directory. Ensureing only the file owner or the root user can actually delete the file or dir. you can only delete a file if you are the user owner of the file or , user owner of the directory that contains the file.** 
to set the sticky bit run `chmod +t <file>`.

You will see the sticky bit enabled with a `T`
```
-rw-r--r-T 1 root root 102400 April  1 01:39 MyFile
```
### Add to a file
- **Symbolic Mode** : `chmod u+s fileA.txt`
- **Absolute Mode** : `chmod 4### fileA.txt`

### Setting the immutable flag
`i` will mean its been set 

`chattr` will change the attributes 

`getfacl` comand of various dirs

# Using UMASK
The umask is a shell setting that defines a mask tha will be **subtracted** from the default permissions.
For example, if default permissions on directories are 777 and default permissions on files are 666
- umask 027 will set default permissions on directories to 750 because `777 - 027 = 750` 
- umask 022 will set default permissions on files to 644 because `666 - 022 = 644`

Umasks of 022 is quite common because it gives the root full access while only giving read + execute permission to the group and others. IT may be represented as 0022 because the first zero will represent the special permissions.
Umask values of 027 will take away the permissions for others.
To read the current umask type `umask` on the terminal. 

To make a umask persist you must set the umask value in `/etc/profile` or `/etc/bashrc`

`umask` is used for any new files , where as `chmod` is for preexisting files.

## Troubleshooting approach
1. Identify the problem 
1. Establish theory of probable cause
1. Test the theory to determine the cause
1. Establish an action plan
1. Implement the solution
1. Verify that we have solved it 
1. Document findings, actions adn outcomes

---





# Linux Storage landscape
Hardware level: Devices  - Storage must be presented to Linux and this storage can come from different environments. There is could be a traditional disk on a machine. Storage can be on SAN (Storage Area Network) with protocols like `iSCSI` or `fibre channel`. These devices drives will be stored in the `/dev/sda/` dir. SDA standing for `SCSI disk A`. The reason it is SCSI disc is that most storage is addressed wot ha SCSI driver , eve nif it is not a SCSI disk. ON that disk you will something to allocate different areas because you don't want ot give it all away. This is where you create partition. These partition allow you to put different. Within the the partition there is an LVM (Logical Volume Manager), at a high level it is like a partition within a partition to give you more flexibility to your storage level.

Depending on your computer hardware, there are two solutions for partitioning schemes. MBR (older; eg CentOS7) and GPT (Ubuntu) . If you use MBR there will be limitations that are only in the new GPT, such as only being able to hold 4 primary partitions and no more. 

Storage device types
- Hard 
- Solid-state
- USB 
- Extenral

## Partitions

There are three tyes of Partition
- **Primary** - Contain 1 file system aka "Volume". Swap file system, Boot partition created here. Swap space is a place to free up actually memeory , 
- **Extended** - Contain server partitions, which are referred to as logical drives
- **Logical** - Partitioned and allocated as an independent unit and function as a separate drive


### /dev/xxxx
EG: `/dev/sda1`
- `/dev/` Device drive
- `sd` - Type of controler 
- `a` first whole drive , `a`,`b`,`c` 
- `1` first partition `1`,`2`,`3`

`/dev/null` - Virtual black hole device
`/dev/zero` - Returns a null/zero every/anytime. Good for sanitizing a device with zeros
- `dd if=/dev/zero of=dev/sdal bs=1GB count=1024`
`/dev/urandom` - Returns a randomised serise of psudorandom numbers for testing
- `head -c5 /dev/urandom`

### Creating Partitions

Block devices - DIsk etc
Charachter Devies - Periferals

Logical Volumes
Managing Logical Volumes
Mounting File Systems
File System Mounting
Managing File Systems
File System Management
Linux Directory Structure
Navigating Directories
Troubleshooting Storage Issues
Storage Usage and Quotas



# MBR Partitions on CentOS7 with fdsk 
Commands 
### lsblk - List block devices. This will show you the devices you have.`
```sh
root@me:~# lsblk
NAME                  MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
vda                   252:0    0   250G  0 disk                     
└─vda1                252:1    0   250G  0 part 
  ├─ubuntu--vg-swap_1 253:0    0  14.9G  0 lvm  [SWAP]
  └─ubuntu--vg-root   253:1    0 235.1G  0 lvm  /
```
### fdisk
A utility to create, modify or delete partitions on a storage drive.
Allows to uspecify the size . 
`-b` specify the number of secors 
 `-H` specify the number of drive head
-`S` specify the number of Sectors per track ,
`-s` print partition size in blocks
`-l` list partition tables for devices
`n` create new partitions 
`d` remove partitions 
`p` Lit existing partitions
`w` Write drive changes and exit utility
`q` Cancel changes made and exit utility

```sh
root@bme:~# fdisk /dev/vda

Welcome to fdisk (util-linux 2.31.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Command (m for help): m
```
partprobe
#### parted
`parted` utility to create , destroy and resize partitions and runs the GNY parted utility.
- `select` Chose deivce or partition to modify
- `mkpart` Create partition with file sytem type specified
- `print` list parrtiotion table
- `resizepart` Resize or modify a partitions end position
- `rm` Delete a partition
- `quit` 

After creation a partition you cannot add that fle system to that partition unless the kernel can read it from the partition table. Best to run partprobel after the `fdisk` comand and will up date the kernel about the partition updates.

### mkfs - Utility for creating and formatting filesystem
`mkfs` is used to build a linux file system.
- `-v` - Verbose output 
- `-V` - Verbose output , includeing all file syetem commands
- `-t` - sprcify type of file systme to build
- `-fs` - file system specific options 
- `-c` - Chekc the device for bad blocks 
- `-l` - read the list of bad blocks

There are many `mkfs.xxx` on Linux. `mkfs.vfat` is useful to know because it will make a partition that is useable on Mac, Linux and Windows. `ntfs` is a bit problem matic because ot cannot be fully supported as it was created out of reverse engineering. 

### /etc/cryptab file
The `/etc/cryptab` stores information about encrypted devices and partitions that must be unlocked and mounted on system boot.



### gdisk - gpt partition utility

### mount - connect a filesystem storage to a directory
After creating a file system amd storage, you need to connect them together. This is process is know nas mounting . it is a simple as. 
```
mount <What-you-want-to-mount> <where-you-want-to-mount-to>
```
a temporary mount directory called `/mnt`is often made by default.  
### findmnt - shows you whats mounted and where it is mounted.
### umount - unmount
### lsof - list open files

## Manageing Networks 
ipv4 is the old version of addressing schemes for different networks with 4 number address such `192.168.5.63`.
Subnetmask 

There are two parts to this address;
The address network : `192.168.5`
The address of the node: `63`


`Router`: This is a device that conects networks together. There router is going to help your package out of your network and get to the internet. It will have a `default gatway` address that is very important for your node as it identifies the router. It is the routers address on the network. If for example you were looking for ip address `7.7.7.7` you would have ot ask your router and he would check is iptabels.

`DNS` -(Domanin Name System) is a name system to save humans remembering long numbers. When you search for `Linux.com` you will go to a DNS server which will retrun the ip address for hte name you have given.

### Network Device nameing 
biosdevname (BIOS-dev-name) uses device names that reveal information about physical location, and **systemd-udevd** generates the network device names. This is more convenient.

The four catagories depend on the info revealed by the driver of the network card
- em123 ( Ethernet Motherboard Portnumber) eg; em0
- p < port > < slot > (PCI, PCI port) eg; p0p6 
- eno123 (EtherNet Onboard) 
- If the driver doesn't reveal sufficient information, eht0 etc is used.



### ip a - shows current network configuration 
`ip a` is a short cut for `ip addr show`
Your response may include 
- `lo` - loop back. This is the internal IP stack. This exists for historical reasons because processes used t communicate with each other this way so an internal ip address was needed. eg: `127.0.0.1`.

- `eth0` - a possible default name for the network interface. We will see the MAC address of the network card. 

```ip route show`` will show you the default route to get out to the internet, AKA the default gateway.  
### ip a a dev etho 1.2.3.4/8 - add an Ip address in run time, useful for testing
### ip route show = shows the routing table to check if you have a default router
### cat /etc/resolv.conf - this is s config where you can verify dns server info

Thi is an auto generated file that contains the ip address of the DNS name server. This is what allows us to use name as as appose ip addresses. 

### dhclient - dhcp server 
This will reach out to dhcp to reobtain the ipv4 address.

### hostname - shows the current hostname 
```hostname``` will return the fqdn (fully qualified domain name)
```hostname -I``` show the current ip address for the hostname.
### hostnamectl - set the hostname
```hostnamectl status``` returns useful info like ```uname -a```
```hostnamectl set-hostname foo.com``` sets the hostname to foo.com

```/etc/nsswithc.conf``` is a file that you can modify the and password DNS lookup order so rather than set your ```/etc/hosts``` file, you can search dns first.

### ping 
Performance testing tools
```ping -f <domainname>``` this will do a flood on the domain 
```ping -f -s 4096 <domainname>``` this will do a flood with packets that are 4kb big on the domain 

### netstat - 
```netstat -tulpen | less``` gives an overview of everything that is listening on the computer.

```sh
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       User       Inode      PID/Program name    
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      101        24698      761/systemd-resolve 
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      0          16146      994/sshd            
tcp6       0      0 :::22                   :::*                    LISTEN      0          16148      994/sshd            
udp        0      0 127.0.0.53:53           0.0.0.0:*                           101        24697      761/systemd-resolve 
udp        0      0 0.0.0.0:68              0.0.0.0:*                           0          493265     8372/dhclient       
udp        0      0 0.0.0.0:68              0.0.0.0:*                           0          15745      737/dhclient        
udp        0      0 0.0.0.0:68              0.0.0.0:*                           0          18715      808/dhclient        
udp        0      0 9.20.193.106:123        0.0.0.0:*                           0          16023      939/ntpd            
udp        0      0 10.51.1.36:123          0.0.0.0:*                           0          16021      939/ntpd            
udp        0      0 127.0.0.1:123           0.0.0.0:*                           0          16019      939/ntpd            
udp        0      0 0.0.0.0:123             0.0.0.0:*                           0          16015      939/ntpd            
udp6       0      0 :::123                  :::*                                0          25022      939/ntpd            
```

addresses that are 0.0.0.0 are serving to the public.
### ss - (Socket Stats) modern replacement of netstat 
```ss -tuna``` same as ```netstat -tulpen```

### dig - DNS lookup utility
dig 

## Time in Linux

The way Time is organised in linux starts with `hardware time`. It starts with the BIOS on the computer . When you start the computer you will get `hardware time`. Durring the boot this will be used to set `system time`. To make sure that `system time` is correct, `Network Time Protocol (ntp)` is used to sync `system time` with the time on the internet. 

### System Time tools
date - classic util to manage dates and the current time settings
```date -s 14:53``` will set the system to be 14:53. 
timedatectl - new tool to set time related properties. You can set the time and time zone etc.

### Hardware Time tools
hwclock - allows you sync hHW and SF clock
```sh
 hwclock -s             # set the system time from the hardware time (RTC)
 hwclock -w             # set the hardware time (RTC) from the system time
```

With ntp the keyword is `stratum`. This indicates the reliability of the server you are interacting with and the distance of eliability you are away from the time source. This ranges from 1 - 16. 1 being linked to an atomic clock. The highest level of reliability. If you synced with a `stratum 1` and you wanted to play a server role, you would get `stratum 2` because you are 1 step removed from the first server. 
`Stratum 10` is a spacial stratum server. this is what aa local ntp stack would get. 
`Stratum 16` is a server advertising an error .

`The insane clock` is an old setting of clock that is too far away. 

ntpdate - fetch time from an ntp server
Can be used ot set the date from a ntp server. In case you have  serious time problem and ou want ot fix it immediately. 

```sh
nptdate `ntp source location`
```

ntpq - Allows you to query ntp
chronyc - Allows you to get detailed info about hte service you are currently syncing with
```chronyc sources``` will show information about te ntp server you ae currently synchronizing with.


# systemd - service manager

**systemd is the manager of everything.** It is the first thing that is started after starting the linux kernel.

```Bootloader >> kernel >> systemd``` .

systmed is responsible for starting all the services and things like the log in prompt. It can start process in parallel and also manages mounts, timers, paths and much more. Because systemd is event driven , it can react to specific events, and so wont start things that are NOT needed. the things that systmed manages are called `units`. there are two types of units in systemd
- Default units in `/usr/lb/systemd/system` # these will be covered in a system update.
- Custom units in `/etc/systemd`            # these are up to you to manage. Eg in an update they wont be touched. In a conflict of two same units, the custom will always win.

A `Target` in the systemd context is a group of services. Some Targets are isolateable, which means you can use them as a state your system should me in
```sh
emergency.target # the minimal trouble shooting target where a minimum of services are going to be loaded
rescue.target # IS an extension on emergency and still for troubleshooting
multi-user.target # Non=graphical starting target
graphical.target # as the name above, full graphical env
```

```sh
systemctl -t help # gives help on available unit types:

service
socket
target
device
mount
automount
swap
timer
path
slice
scope
```
Lots of useful Commands 
```sh
systemctl list-unit-files #list of name, state etc of unit files.  
systemctl list-unit- #list all the units in order or starting 
systemctl start # used to start a unit file 
systemctl status # give you current information about a unit
systemctl restart <servicename>.service # effectively a stop and then a start
systemctl stop # 
systemctl enable # starts up after a unit start
systemctl disable # wont start automatically anymore. 
systemctl list-units # list all units available in the current environment
systemctl set default # manageing the default target
systemctl get default # get info about the default target
systemctl cat <servicename>.service # shows the configuration as it has been defined for a specific unit.
systemctl show # see all the params that can be used in the system configuration for a particular unit.
systemctl edit # command to allow you to edit current configuration.
systemctl daemon-reload # after you have done an edit you need ot run this to get a radload.
systemctl isolate # use to switch between targets 
systemctl list-dependencies # show you everything that will be loaded when you start a specific Target. 
systemctl list-units | grep target # get all the targets
```

# Scheduling Task
First and formost there is `cron` which allows you to schedule re-occuring tasks. It uses the `crond` daemon. `crontab -e` to edit and enable tasks.

`at` is for scheduleing tasks that need to run **AT** a specific moment ( and only once). Uses the atd daemon.
`systemd timers` which are the new alternative to cron jobs. You create a `.timer` unit and run it useing `systemctl`

```crontab -e``` This will automatically open the cron editor where you can write the times and tasks of your cron jobs. 

```sh
at # schedule a job to run once
atq # query
atrm # remove a job
crontab -e # cron editor
systemctl # relatesing to the times 
```
# Logging in Linux

Syslog is the legacy service that takes care of logging and is running on most distributions of Linux. it has different implimentations suc has old `syslog` ,`syslogng` and `rsyslogd`. Most Linux distributions these days are useing rsyslogd. 
`systemd-journald` is a systemd-integrated log service. It is very convenient as it allows you to show current service status information everytime you type `systemctl status`. 

```sh
journalctl              # allows you to interface the systemd journal. This command will show you the complete journal
journalctl -u <unit>    # shows info about a specific unit (use tab completion)
journalctl --dmesg # shows kernel messages
journalctl -u crond --since yesterday --until 9:00 -p info # see specific information about a service within a specific time . -p is the priority , in this case info
journalctl --dmessage # this is a legacy kernel message log that will only give you kernel messages
tail # on /var/log/messages it will show you the last line , which is of most interest
less # to open the /var/log/messages file
logger # command that allows  you to write directly to syslog which is convenient for shellscripts
```
# Understanding rsyslog

The rsyslog service works with facility, priority and destination.
The facility is what rsyslogd should be logging for. these are like keywords that were defined a long time ago. the priority indicates the severity of a log event. the destination defines where the message should be written to.This could be a file, or a specific module.

# Process Management

The hierachy between process. 
At the start of all process, there is the `init process` which currently system d with PID 1, the top level. Process can have children , which can have further children. For example the `init process` can have a child `ssh process` which can have a `bash process`. This is important because if the parent has a problem , the children will too.

# jobs 

`Jobs` in linux are processes that are running from your current shell environment. they will still get a PID too.

Commands
- **jobs** : Command to manage jobs. Jobs are processes that are associated to a specific shell. If hte process is not associated to a specific shell you cannot manage the process with jobs anymore. 
- **fg**: allows you to run process in the forground. its only if you have started it with an '&' behind it to run it in the background.
- **bg**: moves a job ot hte background but before that you need ctl+z, otherwise it will be 


If you run a dummy process that takes a lot of time such as `dd if=/dev/zero of=/dev/null` that copies nothing to nowhere, you can set it t the background by typeing `bg` in the terminal or by writing the command with an & at the end such as `dd if=/dev/zero of=/dev/null &`.
The terminal will return something like 
```
[3] 11449
``` 
which is the job number followed by the process number. To bring the last job to the foreground type `fg`. `fg <job_number>` is also valid.

# TOP
- **top**:  performance dash board for your server, allows you to manage task and gives you a good impression of your machine also see **htop**.

- `top -u <user> ` will show you all the process that are running for a particular user. 
- fields in top: If you press `f` in top you can see a list of all the possible fields. Move the cursor to the one you would like to include and press `space bar`. 
- Sorting is set to default to the CPU usage but you can use the **shift + < / >** keys to move left and right by header on the top row and sort by that field.
- Once you are happy with the setting you can type `W` which will write the settings to the `toprc` file.

# PS 

- **ps** : command line utility to get process information. It has a lot of options and ith grep, it will give you what you need.

When we run `ps aux | less` we see 
TTY = terminal 
```sh
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root         1  0.0  0.0 225572  9168 ?        Ss   Nov01   0:07 /sbin/init
root         2  0.0  0.0      0     0 ?        S    Nov01   0:00 [kthreadd]     # [] means these are kernel process that cannot be killed with kill 
root         4  0.0  0.0      0     0 ?        I<   Nov01   0:00 [kworker/0:0H]
```

If we run `ps -ef | less` this will give us similar information includeing parent process info with the PPID. 
```sh
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 Nov01 ?        00:00:07 /sbin/init
root         2     0  0 Nov01 ?        00:00:00 [kthreadd]
root         4     2  0 Nov01 ?        00:00:00 [kworker/0:0H]
```

`ps -fax | less` will give the forrest display of processes. Shows the relations between processes.
`ps aux --sort pmem | less` sort proccess by different variables. 

- **nice** : adjust the process priority while starting a process. In top we press r to do this. 
- **renice** : similar to nice but for running process and will require a PID instead.


- **kill** to send a signal to a process
The most brutal way to use kill is to use `kill -9 <PID>` but the most elegant way is with `kill <PID>` 

- **killall** : kill many process with the same name.

# Manageing Software
### Libraries and packages
A library is a set of modules which makes sense to be together and that can be used in a program or another library. A package is a unit of distribution that can contain a library or an executable or both. It's a way to share your code with the community.

In the old day software was installed on Linux from source packages. Software was delivered in a compressed tar ball. It could vary what would be in a tar ball; a setup script, or just source files that needed to be compiled. This gave everyone flexability. This would require compileing with things like `make` and `gcc`. The disadvantages of this methodology is that there is no central registration  of software that was installed in this way. This is why there needed to be some sort of management: **Enter the package manager. **

### Software packages
A package is a tar ball with the addition of 
- a script to copy files to the right location 
- a database to keep track of what is installed.  This db is installed in the system and installed by the package.
Packages typically focus on the software they want to install, and use dependencies for related software packages. This means the dependency needs to be installed before you can install the package. This can get tricky!

ON redhat the package manager is `rpm` .

### libraries - special dependencies
They are developed  to make woking with software easier and provide common functionality that may be used by multiple packages. Some libraries are very specific and only provide one special type of functionality. Some are more generic.

the key library that provides all of the common function in the Linux operatinf system is **libc**, a `C-library`.
To figure out which libraries are used by a specific programme file use `ldd`. eg; `ldd /usr/bin/passwd`.

Difference between libraries, dependency and packages.?

### Software mangers
These were developed primarily to fix the dependency problems. They do this by working with repositories which are online resources of packages. Before installing a package , the software manager analyses the dependencies and will try to fetch the dependencies from the repositories. Repositories are provided by the Linux distributions, or software vendores, or you may create your own.
Commmon software managers are 
- yum : RedHAt
- dnf : yum replaccement for fedora
- microdnf : (miniture yum) on containers
- apt : ubuntu


### yum
yum uses repositories that in /etc/yum.repos.d as separate files and the command was written to be intuitive eg; `yum install , yum search, yum remove`. yum also allows you to work with package groups eg; `yum groups list , yum groups install` which can be very convenient. `yum provides` will help you find the right package and `yum history` allows you to undo changes. 

### apt

`apt` is the UBUNTU equivalent to yum and is a newer replacement of older utilities like `apt-cache` and `apt-get` so you may still read in docs anout apt-get. apt repositories are defined in `/etc/apt/source.list`. 

`apt search <package>` 
`apt install <package>`
`apt remove <package>` This will analyze and tell you what it will require to remove this. 

### rpm (RedHat package manager) 
