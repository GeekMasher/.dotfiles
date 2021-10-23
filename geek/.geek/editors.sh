#!/usr/bin/bash

edit() {
    if command -v nvim &> /dev/null; then
        nvim $@
    elif command -v vim &> /dev/null; then
        vim $@
    fi
}


