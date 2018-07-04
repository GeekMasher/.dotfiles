#!/bin/bash
if [ -f "./scripts/myfuncs.sh" ]; then
    source ./scripts/myfuncs.sh
fi

# SHELL
./scripts/lazy_shell.sh $@

# VIM
./scripts/lazy_vim.sh $@

# DOCKER
if [[ "$@" = *"docker"* ]]; then
    ./scripts/lazy_docker.sh $@
fi
