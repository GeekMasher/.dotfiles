#!/bin/bash

PATH=$PATH:~/.local/bin

edit() {
    if command -v nvim &> /dev/null; then
        nvim $@
    elif command -v vim &> /dev/null; then
        vim $@
    elif command -v code &> /dev/null; then
        code $@
    fi
}

alias dot="cd $DOT_FOLDER"

alias dev="cd $DEV_FOLDER && dev-list --tmux"
alias dev-list="$HOME/.local/dev -m list --tmux"
alias dev-add="$HOME/.local/dev -m add"

# Languages

## Python
if [ -x "$(command -v python)" ]; then
    alias python="python3"
    alias freeze="pip freeze > requirements.txt"
    alias pyinstall="python ./setup.py install"
    alias pycompile="python -O -m compileall ./"

    if [ -d $HOME/.local/bin ]; then
        PYTHON_PATH_LOCAL=$(echo $HOME/.local/lib/*/site-packages)
        PATH="$PATH:$PYTHON_PATH_LOCAL"
    fi
fi

## Rust
if [ -d $HOME/.cargo ]; then
    source $HOME/.cargo/env
    PATH=$PATH:~/.cargo/bin
fi

## GOLANG
export PATH=$PATH:/usr/local/go/bin
if [ -x "$(command -v go)" ]; then
    export GOPATH="$HOME/golang"
    export GOUSER="geekmasher"
    export PATH=$PATH:$(go env GOPATH)/bin

    # > https://golang.org/doc/code.html#GOPATH
    alias go-here="export GOPATH=$(pwd) && export PATH=$PATH:$(go env GOPATH)/bin"
    go-create() {
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
