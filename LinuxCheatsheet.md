# Cheat sheet

This is a cheat sheet of lots of useful linux commands. The way I use is to pull it up in my browser and run command F to search for what I am interested in. Enjoy!

## Shell Commands
```sh
# Standard input (0) : \<
sort \< /etc/services  # gets the output of /etc/services and sorts it 

# Standard output (1) : \>
ls \> ~/myfile        # sends Standard output (1) new file and overwrites what was there before 
whoami \>\> ~/myfile  # appends Standard output (1) to the existing file

# Standard Error (2)
grep -R root /proc 2>/dev/null         # this sends the Standard Error (2) to the null device ( nowhere)
grep -R root /etc &> ~/myfile         # this sends Standard Error (2) and all to myfile
alias foo='echo hello'              # Set an alias command foo that will echo hello to the terminal , or whatever you want. Set by default in the /etc/profile
 <COMMAND_1> ; <COMMAND_2> ; <COMMAND_3> ; # run sequential commands split with a semi-colon
```
## List all avalible commands: compgen (Programmable Completion Builtins)

compgen -c              # will list all the commands you could run.
compgen -a              # will list all the aliases you could run.
compgen -b              # will list all the built-ins you could run.
compgen -k              # will list all the keywords you could run.
compgen -A              # function will list all the functions you could run.
compgen -A              # function -abck will list all the above in one go.


## Shell short keys
```sh
Ctl-l               # soft clear of the screen
Ctl-u               # wipe cirrent command line
Ctl-a               # move to the beginning of a line 
Ctl-e               # move to the end of a line 
Ctl-c               # interup the current process (break)
Ctl-d               # exit
```

# Useful misc Commands  
```sh
bash -x <SCRIPT_NAME>                                                       # runs a script in debug mode
set -x                                                                      # puts the shell in debug mode
set +x                                                                      # takes the shell it off debug mode
<COMAND> 2>/dev/null                                                        # 2 relates to the stderr output and will redirect it to the null device 
!<CMD_HISTORY_NUMBER>                                                       # this will run a specific command from your history eg: !234
!foo                                                                        # Will run the last command that started with foo
ctl+a                                                                       # brings your cursor to the beginning of the command line
ctl+r <search_string> ctl+r						    # search through your bash history for commands that match a search string. Step through results by repeating ctl+ r	 
ctl+l                                                                       # clears the terminal 
uname -a                                                                    # will list all the key info about the system you are on
dd if=/dev/zero of=<FILE_TO_CREATE> bs=<BLOCK_SIZE> count=<MEGABYTE_SIZE>   # This will create a file of zeros. Useful for testing data transfers and compressions
 
dd if=/dev/urandom of=/root/<RNADOM_DUMMY_KEY_NAME> bs=4096 count=1                          # This will create a random key of stuff with this
su                                                                          # The switch user command , without any arguments will ask for the root and then switch you to the root user. 
su -                                                                        # Same as above but wil open a new shell with the root environment variables
w                                                                           # Not a typo, type w to see who is logged in on the system AND what they are going 
chmod u+s <file>                                                            #  set the Set User ID (SUID)
chmod +t <file>                                                             # set the Stickybit on the file
find / -perm /4000                                                          # locate files that have SUID
find / -perm /2000                                                          # locate files that have SGID
find / -perm /1000                                                          # locate files that have Sticky bit

stat <FILENAME>                                                             # returns stats on a file eg: size, device, access and mod times

man hier								    # info on the layout of filesystems
```


```sh
lsmod                                   # list all drivers that are currently loaded
modinfo <NAME_OF_KERNEL_DRIVER>         # Get more info on a driver
strace <BASH_COMMAND>                   # will run a system call trace on and command. This can come in handy when you want to see exactly what happened and exactly what might have gone wrong with a linux command. 
strace -c <BASH_COMMAND>                # This shows the counter view of the strace so you can enumerate the time, calls, errors, syscalls. Great for compareing commands.
man (7) signal                          # will show you the man page for all the different Linux signals
netstat -tulpen                         # list open ports
sudo lsof -i tcp -nP                    # for mac list all open tcp ports
```
# automation commands 
```sh
while true; do echo -n "This is a test of while loop";date ; sleep 5; done
```

#  systemctl - Control the systemd system and service manager

```sh
systemctl <tab> <tab>                   # lists all the commands for systemctl
systemctl list-dependencies             # list the dependencies tree
systemctl daemon-reload                 # will update all the service files 
systemctl start <service_name>          # starts a service
systemctl show <service_name>           # will list the details of a service such as Restart
```

# Groups and Users
```sh
groupadd sales                          # addes the group called sales
useradd -G sales Lisa                   # adds a user called Lisa to the group called sales
chgrp sales /data/account               # sets the ownership of the /data/sales dir to the sales group
setfacl -m  d:g:sales:rx /data/sales    # set file acl -m (modify)  d:g:sales:rx is default setting on all files on the group called sales 
setfacl -m  g:sales:rx /data/sales      # without the d: will take care of the directory itself
getfacl <FILE_NAME>                     # return the access controls for a file
chown linda account                     # changes the ownership of the account folder to linda
chmod g+s <FILE_NAME>                   # applies the sticky bit to the file meaning only the owner can delete the file
chattr +i <FILE_NAME>                   # will make the file immutable and so unchangeable and undeletable
chattr -i <FILE_NAME>                   # will undo the immutable setting of a file.
  
ctl+l will clear the screen
su -                            # su stands for switch user and will switch your user. If you don't supply an a user name and just the dash, it will switch you to the root account and open a login shell.
man -k <SEARCH_TERM>            # will return search results for the term from all man pages 
man -k <SEARCH_TERM> | grep 8   # this will look for root user commands (because of the 8)
```
# ls (listing files)
```sh
ls                      # simple listing 
ls -d                   # just show the directory names , not their contents
ls -l                   # long list 
ls -a                   # shows all files including hidden files
ls -lrt                 # sorts on last modification date
ls -ld /home            # lists the properties of the home directory
ls -li <FILE_NAME>      # we will list the inode numbers in the listing 
```
# Wildcards ( Globbing)
```sh
*               # everything
?               # one signal char
[a-c]           # range from a to c
ls [a-c]*       # list all files that start with an a, b or c
ls ?[z-s]*      # list files where the second char is anything from z up to s. 
ls *?[a-z]      # any files which end in a lower case letter  
ls a?s*         # return files that start with a; have any letter; then an s; and then any amount of any letter.
ls a[lm]        # return files that have an l or m on the second position
```
# cp (Copy)
```sh
cp <FILE> <DESTINATION>
cp /etc/hosts .
cp -R /tmp /my 
``` 
# Directory cmds
```sh
cd -                        # goes back to the previous directory
mkdir -p files/morefiles    # -p for parents. This will make the files directory with the morefiles directory within if they don't exist already
cp <FILE_NAME>  ..          # .. means one level up , so this will copy the file to the above directory 
cp ../../<FILE_NAME>        # will copy it two directories up
cp ../<FILE_NAME> .         # this will go up one level, look for the file and copy it to the current directory
```
# find -- find things ( Really good Man page)
```sh
find / -name "hosts"                                                    # find <SEARCH_DIR> -name <SEARCH_NAME >
mkdir /root/amy; find / -user amy -exec cp {} /root/amy \;              # make a dir and copy all these files into it
find / -size +100M                                                      # look for files greater than 100 megabytes

find / type -f -size 100M                                               # find files only that are greater than 100 megabytes
find /etc -exec grep -l Bob {} \; -exec cp {} root/Bob/ \; 2>/dev/null  # find files from the etc dir that contain Bob and return the file names and then copy them to a dir /root/Bob. Any errors are sent to the null device
find /etc -name '*' -type f | xargs grep "foo"                          # look for files only, with any name and within those search for the string "foo". 
find <LOCATION> -type f \( -iname "*.json" \) -exec grep -il <TERM> {} \; > filesOfInterest.txt 2>&1 # find in location files that have .json in them and execute grep on them to search for the term; and then send there name to a file , and errors elsewhere

find / -type d -name "foo"                                              # find a directory with the name foo
```
# tar (tape archiver) 

```tar``` was created a long time ago to stream files to a back-up tape. The basic use is to put files together in one archive; with the option to compress the data. Compression can be added with either ```-z``` (gzip) to ```-j``` (bzip2) as the compression utility.
Basic usage to archive ..

```sh
tar -cvf <NAME_OF_CONTENTS> <CONTENTS_TO_BACKUP>    # (create , verbose , file to create , contents TO THE CURRENT DIRECTORY)
tar -cvf <NAME_OF_CONTENTS> -C <NAME_TO_BACKUP_TO>  # (create , verbose , file to create , Location to store) and then to extract
tar -xvf <NAME_OF_CONTENTS>                         # (extract , verbose , file to extract TO THE CURRENT DIRECTORY)
tar -tvf <NAME_OF_CONTENTS> <NAME_TO_BACKUP_TO>     # (inspect contents only, verbose , file)
tar -tzvf <NAME_OF_CONTENTS> <NAME_TO_BACKUP_TO>    # This will compress the archive down with gzip. FYI - There is marginal saving between the two compression types.
```
# Text editing on Linux

## VI(m) - 

There a few working modes in VI. VIM is VI(improved)
- Command mode - Esc will always bring you back to command mode
- Insert mode - esc , i
- Visual mode - esc, v
When you start, you will get command mode.
To set line numbers in vi, type

### Simple VI commands(all you need) 
- :q! - get out without saving 
- u - undo
- dd - delete a line 
- o - open a new line
- visual mode
- esc, v - go into visual mode. Then use the arrow to select the blocks of text you want
- d - cut the text in the block
- p - paste the text in the block
- y - (yank) is to copy the text in your block 

### search and replace
- / - will bring up the searcher in the bottom left
- gg - bring you to the top
- :%s/foo/bar/ - substitute the first foo and replace it with bar
- :%s/foo/bar/g - globally substitute all foo and replace them with bar

```vimtutor``` in the terminal will open the vimtutor, a very fast and useful resource to learn how to use vi. 

# extra VI commands
```
Insert Mode:
^ 			# to move the cursor to the start of the current line. 
$ 			# to move the cursor to the end of the current line.
```

### More or Less
```more``` was the original file pager so ```less``` was developed (a play on less is more).More was a developed a bit more but you can still do more with ```less```.

Less is based on VI so many keys work in there, such as search. 
- g - go to the top of the file
- G - go to the bottom of the file
- q - quit and go back to the terminal
- / - search the file
    - n - go to the next search result

### head (look from the top) and tail (look from the bottom)
```sh
head /etc/passwd                        # see the first 10 (default) lines 
head -n 5 /etc/passwd                   # see the first 5 lines 
head -n 5 /etc/passwd | tail -n 1       # get the first 5 lines and then show the last line of that
tail -f /var/log/messages               # tail with the fraction option which will keep the file open and show updates, eg failed logins
```

### cat (concatenate) and tac (reads from bottom to top )
```sh
cat -A      # shows all non-printable chars ( eg $ equals 'Enter pressed')
cat -b      # numbers lines 
cat -n      # numbers lines, but not empty lines
cat -s      # suppressed repeated empty lines
```
### Common text processing utils
```sh
cut -d : -f 1 /etc/passwd                           # cut -d <DELIMITER> -f <FIELD> <FILE_TO_INSPECT> -- will return the filtered output
cut -d : -f 1 /etc/passwd | sort                    # as above with the sort alphabetically 
cut -d : -f 1 /etc/passwd | tr [:lower:] [:upper:]  # as before but will translate to UPPER CASE !
sed -n 5p /etc/passwd                               # prints line 5 of /etc/passwd
sed -i s/foo/bar/g <FILE>                           # Immediately(-i) globally(g) substitute(s) bar for foo in the file 
sed -i -e '2d' <FILE>                               # Immediately(-i) edit(-e) the file by deleting the 2nd line ('2d') 
awk -F : '{print \$4 }' /etc/passwd                 # print the 4th column from a /etc/passwd
awk -F : '{print \$4 }' /etc/passwd | sort -n       # as above including a numerical sort
awk -F : ' /foo/ {print \$4 }' <FILE>               # print the value at 4th column from a the line that contains foo 
```

## grep (get regular expression)
```sh
grep -i <TERM> <FILE>                       # search for term on a file and be insensitive to case
cat <FILE> | grep <TERM> | grep -v foo      # search for term and exclude any reference to foo
grep -R <TERM> <LOCATION>                   # do a recursive search for the tem in the directory
grep -R <TERM> <LOCATION> -l                # do a recursive search for the tem in the directory
grep -R foo / -l 2>/dev/null                # recursive list from root of all the files that contain foo  
grep -A3 <TERM> <LOCATION>                  # search for the term and also return 3 lines AFTER the result
grep -B5 <TERM> <LOCATION>                  # search for the term and also return 5 lines BEFORE the result 
grep '^...$'  * 2>/dev/null                 # get all lines from all files that contain exactly 3 chars
grep '\<foo\>' <FILE>                       # return entire lines that contain a particular string eg; foo  
grep '^abc' <FILE>                          # lines that START with 'abc' 
grep 'abc$' <FILE>                          # lines that END with 'abc' 
grep 'a.c' <FILE>                           # lines that contain "a" ANYTHING "C"  
man -k user | egrep '1|8'                   # to use the logical OR in the expression we need to use extended grep
egrep 'ab{2}c' <FILE>                       # look for expression that have an a , 2 bs and then a c at the end. 
egrep '*[bB]*' <FILE>                       # look for expressions that have any kind of b in the middle 
egrep '(123){2}' <FILE>                     # look for occurrences of 123 that happen twice in a row ( repetition operator {})
egrep 'ab+c' <FILE>                         # look for expressions that have b ONE or more times
egrep 'ab*c' <FILE>                         # look for expressions that have b ZERO or more times

```


## Piping
A pipe ```|``` is used to send the output of one command to be used as unput for the next command.
- ps aux " grep http

The tee command combines redirection and piping; It allows you to write output to somewhere, and at the same time, use it as input for another command.
- ps aux | tee \<FILE_NAME\> | grep ssh 


## ssh (secure shell) 
```sh
ssh-keygen                                      # running this will start the process of creating a pair of RSA keys. You can set a passphrase on these keys which is more secure and recommended
ssh-copy-id <SERVER_IP_ADDRESS>                 # This is a simple way to copy ver your public key. You will be asked to authenticate to the Server just once.
scp <FILE> <SERVER_IP_ADDRESS>:/<FOLDERNAME>    # copy a LOCAL file to the address and file name on the REMOTE server
scp <SERVER_IP_ADDRESS>:/<FOLDERNAME> <FILE>    # copy a REMOTE file to the address and file name on the LOCAL server
```

## history ( Command history util) 
```sh
history         # prints a list of all the commands from your history to the terminal
history -w      # appends the latest commands to the .bash_history file
history -c      # clears your history but not the .bash_history file. That will need deleting separately
!164            # repeats command 164 from your history
!!              # repeats the last command that was executed during our terminal session
```



### Session management 
`Loginctl`allows for current session management.
```sh
loginctl <tab> <tab>                        # get all the options.
loginctl list-sessions
loginctl show-session <session-id>          # will show whats been going on with a user such as files open etc. 
loginctl show-user <username>
loginctl terminate-session <session-id>
```

### manageing process

```sh
ps -ef | less  # this will give us similar information includeing parent process info with the PPID. 
ps -fax | less # will give the forrest display of processes. Shows the relations between processes.
ps aux --sort pmem | less # sort the view by the pmemory amount. 
```

## tcpdump 

```sh
ip link show                                               # this will show all your network cards so you know which hones to scan
tcpdump -i eth0 -w $(date +%d-%m-%Y).pcap                  # This will write the output of the tcpdump to a pcap file with the date in the title of the file.
tcpdump -n -i eth0                                         # will not show the host names but instead ip addresses
tcpdump -tttt -i eth0                                      # 4 x t will give you the time stamp in your captures 
tcpdump -n -i eth0 port 22                                 # this will filter to just see things leaveing on port 22
tcpdump -w ssh.pcap -i eth0 dst 192.168.4.10 and port 22   # filter on particular ips and ports , and write t oa certain file

```

## NMAP 
```sh
nmap -sn <Network_IP+SubnetMask>        # scans the entire network
nmap -v -A <Network_IP+SubnetMask>      # agressive verbose network scan
nmap -PN <Ip_Address>                   # pierces through the fire wall apparently ???
nmap -O <Ip_Address>                    # scans for the operating system
nmap -PA                                # tcp AK scan ( 2nd half handshake )

```

## Kubernetes
```sh
kubectl exec --stdin --tty <POD_NAME> -- /bin/bash   				 # get a shell on a machine
kubectl config set-context --current --namespace=<insert-namespace-name-here>    # Set your default namespacce to something else
kubectl -n <NAMESPACE> get pvc | grep -v NAME | awk '{print $1}' | xargs -I arg kubectl delete pvc -n <NAMESPACE> --ignore-not-found=true arg # Delete pvc from a namspace
kubectl config get-contexts							 # get all the contexts from your kube Config file
kubectl config delete-context							 # Delte a context from your kube config and the kube config file.
```

## Docker 
```sh
docker exec -it <CONTAINER_NAME> /bin/bash           # get a shell on a machine
```

## File system cmds
```sh
df -aTh   #  display free (df) disk space on all(-a) mount points (-T) and make it human readable (-h)
```
# Bash Test Operators
## Integer Comparison
```sh
if [ "$a" -eq "$b" ]    # -eq             -> is equal to

if [ "$a" -ne "$b" ]    # -ne             -> is not equal to

if [ "$a" -gt "$b" ]    # -gt             -> is greater than 

if [ "$a" -ge "$b" ]    # -ge             -> is greater than or equal to

if [ "$a" -lt "$b" ]    # -lt             -> is less than

if [ "$a" -le "$b" ]    # -le             -> is less than or equal to

if (("$a" < "$b"))      # <               -> is less than (within double parentheses)

if (("$a" <= "$b"))     # <=              -> is less than or equal to (within double parentheses)

if (("$a" > "$b"))      # >               -> is greater than (within double parentheses)

if (("$a" >= "$b"))     # >=              ->  is greater than or equal to (within double parentheses)
```

## String Comparison
```sh
if [ "foo" = "foo"] # with single brackets use single '='. Returns Boolean 

if [[ $a == z* ]]   # True if $a starts with an "z" (pattern matching).

if [[ $a == "z*" ]] # True if $a is equal to z* (literal matching).

if [ $a == z* ]     # File globbing and word splitting take place.

if [ "$a" == "z*" ] # True if $a is equal to z* (literal matching).

if [ "$a" != "$b" ] #  != -> is not equal to. This operator uses pattern matching within a [[ ... ]] construct.

if [[ "$a" < "$b" ]]        # <  ->  is less than, in ASCII alphabetical order
if [ "$a" \< "$b" ]        # < -> Note that the < needs to be escaped within a [ ] construct.

if [[ "$a" > "$b" ]]    # > -> is greater than, in ASCII alphabetical order. 
if [ "$a" \> "$b" ]     # > Note that the > needs to be escaped within a [ ] construct.
	
if [ -z "$s" ] # -z -> string is null that is, has zero length

if [ -n "$s" ] # -n -> string is not null.
```

## File Test Operators 
```sh
-e      # file exists

-a      # is deprecated and its use is discouraged.
	
-f      # file is a regular file (not a directory or device file)
	
-d      # file is a directory
	
-h      # file is a symbolic link

-L      # file is a symbolic link
	
-b      # file is a block device
	
-c      # file is a character device
	
-p      # file is a pipe
	
-S      # file is a socket
	
-s      # file is not zero size
	
-t      # file (descriptor) is associated with a terminal device
        # This test option may be used to check whether the stdin [ -t 0 ] 
        # or stdout [ -t 1 ] in a given script is a terminal.

-r      # file has read permission (for the user running the test)
	
-w      # file has write permission (for the user running the test)
	
-x      # file has execute permission (for the user running the test)

-g      # set-group-id (sgid) flag set on file or directory

-u      # set-user-id (suid) flag set on file

-k      # sticky bit set

-O      # you are owner of file

-G      # group-id of file same as yours

-N      # file modified since it was last read

-nt     # file f1 is newer than f2
        if [ "$f1" -nt "$f2" ]

-ot     # file f1 is older than f2
        if [ "$f1" -ot "$f2" ]

-ef     # files f1 and f2 are hard links to the same file
        if [ "$f1" -ef "$f2" ]

!       # "not" -- reverses the sense of the tests above (returns true if condition absent).


# Git on the terminal

### Clone Directory
git clone <url>



### Create Project
cd project/
git init                    # initializes the repository
git add .                   # add those 'unknown' files
git commit                  # commit all changes, edit changelog entry
git rm --cached <file>...   # ridiculously complicated command to undo, in case you forgot .gitignore



### Branching and Merging
git branch                          # show list of all branches (* is active)
git checkout -b linux-work          # create a new branch named "linux-work"
<make changes>
git commit -a
git checkout master                 # go back to master branch
git merge linux-work                # merge changesets from linux-work (Git >= 1.5)
git pull . linux-work               # merge changesets from linux-work (all Git versions)
git branch -m <oldname> <newname>   # rename branch
git branch -m <newname>             # rename current branch



### Delete Project
git branch -d <branchname>   	# deletes local branch
git push origin :<branchname>	# deletes remote branch
git remote prune <branchname>	# update local/remote sync



### Merging Upstream

git remote -v 									# Get list of remote branches
git remote add upstream <upstream github url>	# Add original as upstream
git remote -v 									# Check upstream

git fetch upstream 								# Get original repo
git checkout development						# Switch to main branch in local fork
git merge upstream/development					# Merge original with fork

git diff --name-only | uniq | xargs subl		# Fix conflicts in Sublime Text



### Importing Patches
git apply < ../p/foo.patch
git commit -a



### Exporting Patches
<make changes>
git commit -a -m "commit message"
git format-patch HEAD^  # creates 0001-commit-message.txt
                        # (HEAD^ means every patch since one revision before the
                        # tip of the branch, also known as HEAD)




### Inspecting Revisions

# inspect history visually
gitk    # this opens a Tk window, and shows you how the revisions are connected

# inspect history
git log     # this pipes a log of the current branch into your PAGER
git log -p  # ditto, but append a patch after each commit message

# inspect a specific commit
git show HEAD   # show commit info, diffstat and patch
                # of the tip of the current branch



### Referring to Revisions

# by name
git log v1.0.0  # show history leading up to tag "v1.0.0"
git log master  # show history of branch "master"

# relative to a name
git show master^    # show parent to last revision of master
git show master~2   # show grand parent to tip of master
git show master~3   # show great grand parent to tip of master (you get the idea)

# by output of "git describe"
git show v1.4.4-g730996f    # you get this string by calling "git describe"

# by hash (internally, all objects are identified by a hash)
git show f665776185ad074b236c00751d666da7d1977dbe
git show f665776    # a unique prefix is sufficient

# tag a revision
git tag v1.0.0                      # make current HEAD known as "v1.0.0"
git tag interesting v1.4.4-g730996f # tag a specific revision (not HEAD)



### Comparing Revisions
# diff between two branches
git diff origin..master             # pipes a diff into PAGER
git diff origin..master > my.patch  # pipes a diff into my.patch

# get diffstat of uncommitted work
git diff --stat HEAD
```
