#!/bin/bash

# Ghostty shell integration for Bash. This should be at the top of your bashrc!
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
    if [ -f "${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty.bash" ]; then
        builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty.bash"
    fi
fi
