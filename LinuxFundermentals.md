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

# file Cmpression 

gzip is the most common cmpression utility that is also support by Windows and MAc utilities
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
- cut : filter ooutput from a text file
- sort : often used in pipes
- tr : translates uppercase to lowercase
- awk : search for specific patterns 
- sed : powerful stream editor to batch-modify text files.
