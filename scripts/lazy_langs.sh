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