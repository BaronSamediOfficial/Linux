
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
alias hgg='history | grep'
alias gc='groovyConsole'
alias localscan='nmap -A -p- 127.0.0.1'
alias portscan="nmap -n -T5 -v -p-"    # quiet nmap scan on all ports 
alias ping='ping -c 4' # limit pings to just 4 counts 
alias cl='clear'
alias k='kubectl'
alias p='pwd'
alias l='ls'
alias ll='ls -la'
alias loc='locate'
alias mk='mkdir'
alias gr='grep'
alias prof='vi /Users/geoffreyowden/.bash_profile'
alias h='history'
alias v='vim'
alias rm='rm -i'
alias cx='chmod +x'
alias env='env | sort'
alias k="kubectl"
alias kcv="kubectl config view"
alias kinfo="k cluster-info"
alias kgc="kubectl get cronjobs"
alias kgd="kubectl get deployments"
alias kgp="kubectl get pods"
alias kgr="kubectl get replicasets"
alias kgs="kubectl get statefulsets"
alias kdashinit="kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml"
alias pyServe="python -m http.server 9999"          # creates a SimpleHTTPServer(2) on port 9999. This is the py3 version
alias myip="dig TXT +short o-o.myaddr.l.google.com @ns1.google.com"

export HISTIGNORE="&:ls:[bf]g:exit:history:pwd:id"          # Ignores basic commands for the bash history file
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
```
