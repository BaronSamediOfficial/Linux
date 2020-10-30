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

- StickyBit: only has effect on directories and if it is set on a file or directory only allows the deletion of that object if they are the owner of the item ( file , directory)

- ACL ( Access controls Lists) : Created for setting default permissions and to specify multiple owners.

- Attributes: These are properties that an admin can set on a file. 

Set up groups wit j