#!/bin/bash

#set -e

DOT_FOULDERS="bin,tmux,nvim,zsh,geek,vscode,personal,github,misc"

if ! command -v stow &> /dev/null; then
    sudo apt install -y stow
fi

for folder in $(echo $DOT_FOULDERS | sed "s/,/ /g"); do
    echo "[+] Folder :: $folder"
    stow --ignore=README.md --ignore=LICENSE \
        -t $HOME -D $folder
    stow -v -t $HOME $folder
done

# Reload shell once installed
echo "[+] Reloading shell"
exec $SHELL -l
