#!/usr/bin/bash

set -e

DOT_FOULDERS="bin,tmux,nvim,zsh,bash,geek,personal,github"

for folder in $(echo $DOT_FOULDERS | sed "s/,/ /g"); do
    echo "[+] Folder :: $folder"
    stow --ignore=README.md --ignore=LICENSE \
        -t $HOME -D $folder
    stow -v -t $HOME $folder
done


