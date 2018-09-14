#!/bin/bash
if [ -f "./scripts/myfuncs.sh" ]; then
    source ./scripts/myfuncs.sh
elif [ -f "./myfuncs.sh" ]; then
    source ./myfuncs.sh
fi

# CLEAN
if [[ "$@" = *"clean"* ]]; then
    banner "Cleaning bash and zsh files + firs"
    rm -rf ~/.bashrc ~/.geek ~/.zshrc
fi


# .GEEK DIR
if [ -e ~/.geek ]; then
    banner "~/.geek folder exists..."

    # # foreach file in 
    # for filename in "$(getHome .geek/)"*; do
    #     print.info "$filename"

    #     if [ ! -e ~/.geek/$(basename $filename) ]; then
    #         banner "Creating symlink for $(basename $filename)..."
    #         # ln -s "$(getHome .geek)" "~/.geek/$(basename $filename)"
    #     else
    #         print.info "File exists :: ~/.geek/$(basename $filename)"
    #     fi
    #     # if [ ! -f "~/.geek/" ]
    # done
else
    banner "Creating '~/.geek' symlink"
    ln -s "$(getHome .geek)" ~/.geek
fi


# BASH VARS
if [ ! -f ~/.bash_variables ]; then
    # do not overwrite existing file 
    banner "Copying template variables over..."
    cp ./home/.geek/01-variables ~/.bash_variables
fi


# ZSH
if [[ "$@" = *"zsh"* ]]; then
    # https://github.com/robbyrussell/oh-my-zsh
    banner "Installing zsh..."
    sudo apt-get install zsh

    if [ -f ~/.zshrc ]; then
        mv ~/.zshrc ~/.zshrc.bak
    fi
    banner "Creating '~/.zshrc' symlink"
    ln -s "$(getHome .zshrc)" ~/.zshrc

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    # change the default shell to zsh
    chsh -s /bin/zsh

# BASHRC
# else
#     # default is bash 
#     banner "Creating '~/.bashrc' symlink"
#     ln -s "$(getHome .bashrc)" ~/.bashrc
fi
