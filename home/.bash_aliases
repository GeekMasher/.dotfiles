#!/bin/bash

alias ll="ls -l"
alias la="ls -la"

# Quite hacks
alias update="sudo -s -- 'apt-get update; apt-get upgrade'"

# Server aliases
alias ssh-ext="ssh -p 443 192.168.1.1 -t 'tmux'"
alias ssh-tst="ssh -p 9980 geek@127.0.0.1 -t 'tmux'"


# Watch commands
alias watch-ip="watch ifconfig"
alias watch-net="watch netstat"
alias watch-dir="watch ls -la"

