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
if [ ! -d "$(getHome .geek)" ]; then
    banner "Creating '~/.geek/' symlink"
    ln -s "$(getHome .geek)" ~/.geek
fi

# BASH VARS
if [ ! -f ~/.bash_variables ]; then
    banner "Copying over variables..."
    cp ./home/.geek/01-variables ~/.bash_variables
fi

# BASHRC
if [ ! -f ~/.bashrc ]; then
    banner "Creating '~/.bashrc' symlink"
    ln -s "$(getHome .bashrc)" ~/.bashrc
fi


# ZSH
if [ ! -f ~/.zshrc ]; then
    banner "Creating '~/.zshrc' symlink"
    ln -s "$(getHome .zshrc)" ~/.zshrc
fi

if [[ "$SHELL" != *"zsh" ]]; then
    # https://github.com/robbyrussell/oh-my-zsh
    banner "Installing zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    chsh -s /bin/zsh

    sudo apt-get install screenfetch
fi
