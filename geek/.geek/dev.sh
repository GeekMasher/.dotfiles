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

dot() {
    # if dev present, run dev command
    # dev -q dotfiles
    if [ -x "$(command -v dev)" ]; then 
        dev -q dotfiles
        exit 0
    fi

    if [ -x "$(command -v figlet)" ] && [ -x "$(command -v lolcat)" ]; then
        # Only pretty print if both `figlet` and `lolcat` is present
        figlet -w 500 -f slant "Dotfiles" | lolcat
    fi
    cd $DOT_FOLDER
}

# Tools

## Mason (nvim) installed tools / binaries
if [ -d $HOME/.local/share/nvim/mason/bin ]; then
    PATH=$PATH:$HOME/.local/share/nvim/mason/bin
fi

# Languages

## Python
alias python="python3"
alias pyfreeze="pip freeze > requirements.txt"
alias pyinstall="python ./setup.py install"
alias pycompile="python -O -m compileall ./"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

## Rust
if [ -d $HOME/.cargo ]; then
    export RUST_LOG=info
    source $HOME/.cargo/env
    PATH=$PATH:~/.cargo/bin
fi

## GOLANG
# if go is installed, add to PATH
if [ -d $HOME/go ]; then
    export PATH=$PATH:/usr/local/go/bin
    export GOPATH="$HOME/golang"
    export GOUSER="geekmasher"
    export PATH=$PATH:$(go env GOPATH)/bin
    # > https://golang.org/doc/code.html#GOPATH
    alias go-here="export GOPATH=$(pwd) && export PATH=$PATH:$(go env GOPATH)/bin"
fi

## JavaScript
if [ -d $HOME/.nvm ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

