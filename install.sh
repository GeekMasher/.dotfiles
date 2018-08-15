#!/bin/bash
if [ -f "./scripts/myfuncs.sh" ]; then
    source ./scripts/myfuncs.sh
fi

if [[ "$@" = *"standard"* ]]; then
    # install the standard packages I do...
    ./scripts/lazy_shell.sh zsh
    ./scripts/lazy_langs.sh python javascript golang 
    ./scripts/lazy_developver.sh vim vscode
    ./scripts/lazy_docker.sh

else
    # SHELL
    ./scripts/lazy_shell.sh $@

    # VIM
    if [[ "$@" = *"vim"* ]]; then
        ./scripts/lazy_vim.sh $@
    fi

    # DOCKER
    if [[ "$@" = *"docker"* ]]; then
        ./scripts/lazy_docker.sh $@
    fi

    ./scripts/lazy_developver.sh $@

fi
