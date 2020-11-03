### MAC( Mandatory access Control) and DAC ( Discretionary Access Control )

Discretionary access Controls is a means of restricting access to objects based on the identity of the subject and the groups with which they belong. The discretion is from subjects that have certain permissions, being capable to pass permissions on to other subjects. Thats what users,groups and permission are all doing. 

In Linux, two DAC mechanism are used
- Owner-based permission together with file modes
- Capability Systems 

Owner-based permission : UGO ( User , Group and Others). Every file has an owner and every entity that is UGO has user group permissions applied to it. 

permissions include: Read, Write and execute. 

There are also some specials to meet specific needs

- SUID (Set User ID): only has a meaning on a file. It allows a user to run a file as the owner of the file and not as them selves, so SUID == root will alow a user to be the root of the system while that file is running .

- SGID (Set Group ID ): same as above but for the group ownership. 

- StickyBit: only has effect on directories and if it is set on a file or directory only allows the deletion of that object by the owner of the item ( file , directory).

- ACL ( Access controls Lists) : Created for setting default permissions and to specify multiple owners.

- Attributes: These are properties that an admin can set on a file. 

# Capabilities

Capabilities are settings which give a files and software different access controls for the task they need to do.  

### MAC

The big difference MAC is the operating system enforces, and there is nothing the user can do about it; and thats why MAC is stringer than DAC on Linux.

This is implemented in the way the operating system constrains the ability of a subject or initiator to access or generally preform some sort of operation on an object or target. Subjects are typically users, processes or threads. Targets are typically files, directories, network ports , shared memory segments, IO devices. The subjects as well as the targets have a set of security attributes. Based on these authorization rules, the OS kernel can examine the attributes and decide if access is allowed by a subject to a target or not. 

The leading standard of MAC solutions on Linux is SELinux. SELinux originates from Red HAt, currently available of most distributions and co-developed with the NSA (apparently) but still open source. 

Smack is a MAC solutions set up for embedded systems. 

In SELinux...
setenforce permissive # Allows everything but still logs it all
setenforce Enforcing # turns SELinux back on for 


```sh
su           # The switch user command , without any arguments will ask for the root password and then switch you to the root user. 
su -         # Same as above but wil open a new shell with the root environment variables
sudo -i      # opens a rot shell
ssh-copy-id 
w           # Not a typo, type w to see who is logged in on the system
```

To configure the sudoers for the system , use the command ```sudo visudo``` .

## Working with Users and groups

groupadd (create groups)

adduser (Ubuntu) & useradd (Centos)

```sh
adduser  bob                # add bob as a user ( UNUNTU only)
usermod --help              # Lots of options including locking and unlocking accounts
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
/etc/shadow
/etc/group
/etc/gshadow
/etc/passwd

`/etc/passwd` - this is historically the file tha Unix has used to store user information. As this file is normally set to read for all users, the passwords are no longer stored in here. Instead they are encrypted and stored in hte `/etc/shadow`. Groups are stored in `/etc/group` . `/etc/gshadow` is not used anymore but it is a legacy file to set passwords for groups. You can modify the users and groups the safest way is to use `vipw` which will open a temporary file of `/etc/passwd` in VI. This will prevent cases where other users aer in `useradd`. OT do the same for `/etc/shadow`, use `vipw -s`. `vigr` will let you edit groups.

/etc/login.defs