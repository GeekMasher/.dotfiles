#!/bin/bash
if [ -f "./scripts/myfuncs.sh" ]; then
    source ./scripts/myfuncs.sh
fi

APPS=""

if [[ "$@" = *"standard"* ]]; then
    APPS="zsh vim vscode"
elif [[ "$@" = *"developer"* ]]; then
    APPS="zsh vim vscode python golang javascript docker"
elif [[ "$@" = *"server"* ]]; then
    APPS="zsh vim docker"
    if [[ "$@" = *"kubes"* ]]; then
        APPS="$APPS kubernates"
    fi
else
    echo "[!] No profile was set..."
fi

echo "[+] Apps: $APPS"

    ./scripts/lazy_kubes.sh $@
    ./scripts/lazy_developver.sh $@

    # source $filename PROFILE $APPS
done
