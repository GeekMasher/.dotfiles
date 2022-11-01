#!/bin/bash

# References
#   - https://github.com/atomantic/dotfiles/blob/master/homedir/.shellaliases
#   - https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html

# Color support
[[ "$TERM" == "xterm" ]] && export TERM=xterm-256color

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


alias tm="tmux a -t main || tmux new -t main"

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'

# cd commands
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'

alias rename="mv $1 $2"

# ls commands
alias ll="ls -l"
alias la="ls -la"

# ip address commands
alias ip.all="ip addr | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias ip.dns="dig +short myip.opendns.com @resolver1.opendns.com"
alias ip.http='curl -s http://checkip.dyndns.org/ | sed "s/[a-zA-Z<>/ :]//g"'
alias ip.vpn='if [ "$(ip.dns)" == "$SERVER_EXT_IP" ]; then; echo "\033[0;32mUsing VPN\033[0m"; else; echo "\033[0;31m[!!!] Not Using VPN\033[0m"; fi'
alias ports='netstat -tulnp'

# iptables
alias firewall='sudo /sbin/iptables -L -n -v --line-numbers'
alias firewall.in='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias firewall.out='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias firewall.fw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'

# Watch commands
alias watch.ip="watch --color ifconfig"
alias watch.net="watch --color netstat -lpn -u -t"
alias watch.dir="watch --color ls --color -las"

# misc
alias now='date +"%T"'
alias reload="exec $SHELL -l"
alias count.files="ls -l $1 | grep -v ^l | wc -l"
alias edit="nvim"
alias svim="sude vim $*"
alias top='htop'
alias rename="mv $1 $2"
alias chmox="chmod -x $@"


unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac


colour-test() {
    awk 'BEGIN{
        s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
        for (colnum = 0; colnum<77; colnum++) {
            r = 255-(colnum*255/76);
            g = (colnum*510/76);
            b = (colnum*255/76);
            if (g>255) g = 510-g;
            printf "\033[48;2;%d;%d;%dm", r,g,b;
            printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
            printf "%s\033[0m", substr(s,colnum+1,1);
        }
        printf "\n";
    }'
}

explorer() {
    if [ -x "$(exo-open)" ]; then    
        exo-open --launch FileManager $@
    elif [ -x "$(nautilus)" ]; then
        nautilus $@
    fi
}

afk() {
    if [ -x "$(xflock4)" ]; then
        # XFCE
       echo "Locking XFCE session..."
    elif [ -x "/usr/bin/pmset" ]; then
        # macbooks
        echo "Locking Macbook..."
        pmset displaysleepnow
    fi
}


