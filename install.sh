#!/bin/bash

geek_info() {
    echo "[+] $1"
}
geek_error() {
    echo "[-] $1"
}


# > Bashrc files
PATH_BASHRC="$PWD/home/.bashrc"
if [ ! -e $PATH_BASHRC ]; then
    ln -s $PATH_BASHRC ~/.bashrc
else
    geek_error ".bashrc file already exists, please remove and try again"
fi

# > Geek dir
PATH_GEEK="$PWD/home/.geek"

if [ -e $PATH_GEEK ]; then
    geek_info "creating a Symlink to .geek/ dir"
    ln -s $PATH_GEEK ~/.geek
else
    geek_error "~/.geek exists already, please remove and try again"
fi

# > bash vars
PATH_BASHVARS="$PWD/home/.bash_variables"
if [ ! -e $bash_variables ]; then
    cp "$PATH_GEEK/01-variables" "$PATH_BASHVARS"
else
    geek_error "~/.bash_variables exists already"
fi

# > vim setup

# ln -s $PATH_BACHRC ~/.bashrc

