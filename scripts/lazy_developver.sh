#!/bin/bash
if [ -f "./scripts/myfuncs.sh" ]; then
    source ./scripts/myfuncs.sh
elif [ -f "./myfuncs.sh" ]; then
    source ./myfuncs.sh
fi


# Python
if [[ "$@" = *"python"* ]]; then
    banner 'Installing Python...'
    sudo apt-get install python3 python3-pip

    pip install virtualenv
fi

# JavaScript
if [[ "$@" = *"javascript"* ]]; then
    # - https://github.com/creationix/nvm#install-script
    banner 'Installing JavaScript (NVM)...'
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

    nvm install node
fi

# VSCode
if [[ "$@" = *"vscode"* ]]; then
    # - https://code.visualstudio.com/docs/setup/linux
    banner "Installing VSCode..."
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg

    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

    sudo apt-get update
    sudo apt-get install code
fi

# Pycharm
if [[ "$@" = *"pycharm"* ]]; then
    sudo apt-get install wget
    PYCHARM="pycharm-professional-2018.1.4"

    # download artefacts
    if [ ! -f "/tmp/$PYCHARM.tar.gz" ]; then
        wget -o /dev/null -O "/tmp/$PYCHARM.tar.gz" https://download.jetbrains.com/python/$PYCHARM.tar.gz
    fi
    if [ ! -f "/tmp/$PYCHARM.tar.gz.sha256" ]; then
        wget -o /dev/null -O "/tmp/$PYCHARM.tar.gz.sha256" https://download.jetbrains.com/python/$PYCHARM.tar.gz.sha256
    fi

    if [ ! -x $(checksum /tmp/$PYCHARM.tar.gz) ]; then 
        echo "[!!!] Security Warning :: Checksum failed"
    fi
fi

