
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
