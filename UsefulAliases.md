
Useful Installs on Linux

- bash-completion     // extras for tab completion 

Useful BASH scripting script and course
https://linuxcommand.org/lc3_adv_new_script.php

Useful Aliases
```sh

# ------ function to find the current git branch - used in the PS1 ------
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "
# ------------------------------------------------------------------------

# --- handy functions ---
# makes a dir and then cds into it
mcd () {
    mkdir -p "$1"
    cd "$1"
}

# Aliases

alias tcpdump='sudo tcpdump'
alias pub="cat .ssh/id_rsa.pub"
alias watch="watch -n 2"
alias fuff="/Users/geoffreyowden/go/bin/ffuf"
alias opentunnel="ssh -f -N -M -S /tmp/sshtunnel -D 1080 owdeng@xfeht-scanner.fyre.ibm.com -p22"
alias closetunnel="ssh -S /tmp/sshtunnel -O exit xfeht-scanner.fyre.ibm.com -p22"
alias owdeng="ssh owdeng@xfeht-scanner.fyre.ibm.com"
alias tcplisten='sudo tcpdump "icmp"'

alias myip="dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com"
alias pyServer="python -m http.server 9999"  
alias localscan='nmap -A -p- 127.0.0.1'
alias hgg='history | grep'
alias portscan="nmap -n -T4 -vvv -p-"    # nmap scan on all tcp ports 
alias gh='history | grep'
alias gc='groovyConsole'

alias portscan="nmap -n -T4 -vvv -p-  "
alias ping='ping -c 4'
alias cl='clear'
alias cll='clear; ll'
alias count='find . -type f | wc -l'
alias k='kubectl'
alias p='pwd'
alias l='ls'
alias ll='ls -la'
alias lh='ls -lh'
alias lt='du -sh * | sort -h'                   # displays the size of each item, sorts by size, with kind of file. 
alias loc='locate'
alias mnt='mount | grep -E ^/dev | column -t'    # output of mount by column hard drives are mounted
alias mk='mkdir'
alias gr='grep'
alias prof='vi /Users/geoffreyowden/.bash_profile'
alias h='history | tail -n 70'
alias v='vim'
alias rm='rm -i'
alias trs='trash'                                # home brew plugin to send items to the trash
alias cx='chmod +x'
alias env='env | sort'

alias myip="curl http://ipecho.net/plain; echo""
alias pyServer="python -m http.server 9999"  
alias localscan='nmap -A -p- 127.0.0.1'
alias portscan="nmap -n -T4 -vvv -p-"    # nmap scan on all tcp ports 
alias gh='history | grep'
alias gc='groovyConsole'
alias ping='ping -c 4'
alias cl='clear'
alias cll='clear; ll'
alias count='find . -type f | wc -l'
alias k='kubectl'
alias p='pwd'
alias l='ls'
alias ll='ls -la'
alias lt='du -sh * | sort -h'                   # displays the size of each item, sorts by size, with kind of file. 
alias loc='locate'
alias mnt='mount | grep -E ^/dev | column -t'    # output of mount by column hard drives are mounted
alias mk='mkdir'
alias gr='grep'
alias prof='vi /Users/geoffreyowden/.bash_profile'
alias h='history | tail -n 70'
alias v='vim'
alias rm='rm -i'
alias cx='chmod +x'
alias env='env | sort'
alias k="kubectl"
alias kcv="kubectl config view"
alias kinfo="k cluster-info"
alias kgc="kubectl get cronjobs"
alias kgd="kubectl get deployments"
alias kgp="kubectl get pods -o wide"
alias kcd="kubectl get crd"
alias kgr="kubectl get replicasets"
alias kgs="kubectl get statefulsets"
alias kcf="kubectl create -f"
alias kdashinit="kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml"
alias pyServe="python -m http.server 9999"          # creates a SimpleHTTPServer(2) on port 9999. This is the py3 version
alias myip="dig TXT +short o-o.myaddr.l.google.com @ns1.google.com" # gets your local ip by bounceing off google
alias pub="cat .ssh/id_rsa.pub"
alias nmap-scripts-list='nmap --script-help=all | grep '\''^[a-zA-Z0-9-]*$'\'' | grep -v '\''^$'\'
alias ref="source ~/.bash_profile"
alias tcplisten='sudo tcpdump "icmp"'



# Force deletes digital ocean pods running 
alias deldigocean="doctl compute droplet list --format "Name" | tail -n +2 | xargs -I {} doctl compute droplet delete {} -f"

export HISTIGNORE="&:ls:[bf]g:exit:history:pwd:id"          # Ignores basic commands for the bash history file
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
dfc () {
   echo "Stopping all docker containers ... "
   docker stop $(docker ps -a -q)
   echo "Removeing all excited containers ..."
   docker rm $(docker ps -a -f status=exited -q)	     # remove all excited containers
   echo "Removeing all images ..."
   docker rmi $(docker images -a -q)		     # remove all images
}

```

