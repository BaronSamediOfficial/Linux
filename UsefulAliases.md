
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

# Aliases 
alias myip="dig TXT +short o-o.myaddr.l.google.com @ns1.google.com"
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

export HISTIGNORE="&:ls:[bf]g:exit:history:pwd:id"          # Ignores basic commands for the bash history file
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
```
