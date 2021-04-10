

# Linux storage
Appplications make system calls which go to the VFS ( Virtual file system). The VFS is an abstraction )


System calls go to the VFS ( Virtual File System) which alllows generic communication.

### LVM 
At the centre of LVM is the `volume group`. Which is abstraction of all storage in your environment. COuld be 1 to n disks. From the volume group you can make `Logical Volumes`. On top of these logical volumes you would make file systems such as XFS , SWAP , EXT4 etc. What is very convenient when working with LVM is the `Snapshot`, a copy of the meta data of the LVM. This allows you revert back to a previous state of the Logical Volume. This is great for making backups. 

TO see the block devices we can inspect here:
```sh
 cat /proc/partitions
major   minor     blocks name

 252        0  262144000 vda
 252        1    1048576 vda1
 252        2  261094400 vda2
 253        0  244318208 dm-0
 253        1   16773120 dm-1
```
