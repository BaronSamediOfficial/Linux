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
```

To configure the sudoers for the system , use the command ```sudo visudo``` .

