#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

DOT_FOLDERS="bin,tmux,shells"


for folder in $(echo $DOT_FOLDERS | sed "s/,/ /g"); do
    echo "[+] Install folder: $folder"

    if [[ ! -f "$HOME/$folder" ]]; then
        dot_folder="$SCRIPT_DIR/$folder"

        for file in $(find $dot_folder -maxdepth 1 ! -path $dot_folder); do

            link_source="$dot_folder$file"
            link_path="$HOME$file"

            # echo " >> $link_source -> $link_path"
            ln -s $link_source $link_path
        done
    fi
done
