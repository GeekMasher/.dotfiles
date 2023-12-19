#!/bin/bash

set -e
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
INSTALL_JSON=$SCRIPT_DIR/install.json
PRESENT=false

DOT_FOLDERS="bin,assets,tmux,nvim,zsh,dev,geek,misc"


# parse other arguments
for i in "$@"; do
  case $i in
    -i|--interactive)
        # interactive using GUM
        DOT_FOLDERS="bin,assets,misc"
        SELECTED=$(cat $INSTALL_JSON | jq -r 'keys_unsorted[]' | gum choose --limit 10)
        for choice in $(echo $SELECTED | sed "s/,/ /g"); do
            DOT_FOLDERS="$DOT_FOLDERS,$(cat $INSTALL_JSON | jq -r ".$choice")"
        done
        shift
        ;;
    -p|--personal)
        echo "Enabling Personal mode..."
        DOT_FOLDERS="$DOT_FOLDERS,personal"
        shift
        ;;
    -c|--code-review|--security)
        echo "Enabling Code Review mode..."
        DOT_FOLDERS="$DOT_FOLDERS,security"
        ;;
    -s|--server)
        echo "Enabling Server mode..."
        DOT_FOLDERS="$DOT_FOLDERS"
        shift
        ;;
    -w|--work)
        echo "Enabling Work mode..."
        DOT_FOLDERS="$DOT_FOLDERS,github,vscode"
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

echo "[+] Dotfiles :: $SCRIPT_DIR"

if ! command -v stow &> /dev/null; then
    sudo apt install -y stow
fi

for folder in $(echo $DOT_FOLDERS | sed "s/,/ /g"); do
    echo "[+] Folder :: $folder"

    stow -t $HOME -D $folder \
        --ignore=README.md --ignore=LICENSE 
    stow -t $HOME $folder
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


