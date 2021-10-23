#!/usr/bin/env bash

set -e

DOT_FOULDERS="bin,tmux,zsh,geek"

for folder in $(echo $DOT_FOULDERS | sed "s/,/ /g"); do
    stow -t $HOME -D $folder
    stow -v -t $HOME $folder
done


