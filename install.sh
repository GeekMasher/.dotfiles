#!/bin/bash

set -e
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PRESENT=false

DOT_FOULDERS="bin,tmux,nvim,zsh,dev,geek,misc"

# parse other arguments
for i in "$@"; do
  case $i in
    -p|--personal)
        echo "Enabling Personal mode..."
        DOT_FOULDERS="$DOT_FOULDERS,personal"
        shift
        ;;
    -s|--server)
        echo "Enabling Server mode..."
        DOT_FOULDERS="$DOT_FOULDERS"
        shift
        ;;
    -w|--work)
        echo "Enabling Work mode..."
        DOT_FOULDERS="$DOT_FOULDERS,github,vscode"
        shift
        ;;
    -*|--*)
        echo "Unknown option $i"
        exit 1
        ;;
    *)
        ;;
  esac
done



if ! command -v stow &> /dev/null; then
    sudo apt install -y stow
fi

for folder in $(echo $DOT_FOULDERS | sed "s/,/ /g"); do
    echo "[+] Folder :: $folder"
    stow --ignore=README.md --ignore=LICENSE \
        -t $HOME -D $folder
    stow -v -t $HOME $folder
done

# Look for DOT_FOLDER in the .env
while IFS= read -r var; do
  [[ $var =~ ^DOT_FOLDER.* ]] && PRESENT=true
done < "$HOME/.env"

# If not present, write the DOT_FOLDER var into the file
if [[ $PRESENT == "false" ]]; then
    echo "[+] Adding DOT_FOLDER to .env"
    echo "DOT_FOLDER=$SCRIPT_DIR" >> $HOME/.env
fi
# Reload shell once installed
echo "[+] Reloading shell..."
exec $SHELL -l


