#!/bin/bash
if [ -f "./scripts/myfuncs.sh" ]; then
    source ./scripts/myfuncs.sh
elif [ -f "./myfuncs.sh" ]; then
    source ./myfuncs.sh
fi

# CLEAN
if [[ "$@" = *"clean"* ]]; then
    banner "Cleaning vim dirs and files"
    rm -rf ~/.vim/ ~/.vimrc
fi


# - https://vimawesome.com/

if [ ! -d ~/.vim/ ]; then
    mkdir -p ~/.vim/bundle/
    
    banner "Creating symlinks..."
    ln -s "$(getHome .vimrc)" ~/.vimrc
    ln -s "$(getHome .vim/colors/)" ~/.vim/colors

    # clone repo
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    # install the plugins
    vim +PluginInstall +qall
fi
