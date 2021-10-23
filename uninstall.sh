#!/bin/bash

DOT_FOLDERS=*/

for folder in $(echo $DOT_FOLDERS | sed "s/,/ /g"); do
    echo "[+] $folder"
    stow -D -v -t $HOME $folder
done

