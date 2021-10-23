#!/bin/bash

# Languages

## Python
if [ -x "$(command -v python)" ]; then
    alias python="python3"
    alias freeze="pip freeze > requirements.txt"
    alias pyinstall="python ./setup.py install"
fi

## GOLANG

if [ -x "$(command -v go)" ]; then

export GOPATH="/work/development/golang"
export GOUSER="geekmasher"
export PATH=$PATH:$(go env GOPATH)/bin

# > https://golang.org/doc/code.html#GOPATH
alias go.here="export GOPATH=$(pwd) && export PATH=$PATH:$(go env GOPATH)/bin"
go.create() {
    if [ -z "$GOUSER" ]; then
        # use git's username
        GOUSER=$(git config --global user.name)
    fi
    # create project + path
    PROJ=$GOPATH/src/github.com/$GOUSER/$1
    mkdir -p $PROJ && cd $PROJ
    # create git repo
    git init
    # go to workspace
    cd $GOPATH
}
fi

## JavaScript
if [ -x "$(command -v node)" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi
