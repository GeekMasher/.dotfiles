#!/usr/bin/env bash

set -e

DOT_FOULDERS="bin,tmux,nvim,zsh,geek,github"

for folder in $(echo $DOT_FOULDERS | sed "s/,/ /g"); do
    echo "[+] Folder :: $folder"
    stow -t $HOME -D $folder
    stow -v -t $HOME $folder
done


