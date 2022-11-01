#!/bin/bash 

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# Base commands
alias deb-install="sudo dpkg -i $1 && sudo apt install -f"


update() {
    if [[ "$machine" == "Linux" ]]; then
        sudo apt update -y 
        sudo apt upgrade -y
    elif [[ "$machine" == "Darwin" ]]; then
        brew update
        brew upgrade
    else
        echo "Unknown OS: $machine"
    fi
}

upgrade() {
    if [[ "$machine" == "Linux" ]]; then
        sudo apt upgrade -y 
        sudo apt dist-upgrade -y
        sudo apt autoremove -y 
        sudo apt clear -y
    elif [[ "$machine" == "Darwin" ]]; then
        # Open App Store
        open -a "App Store"
    else
        echo "Unknown OS: $machine"
    fi
}

install() {
    # Update first before search
    update 

    if [[ "$machine" == "Linux" ]]; then
        sudo apt install -y $*
    elif [[ "$machine" == "Darwin" ]]; then
        brew install $@
    else
        echo "Unknown OS: $machine"
    fi
}

search() {
    if [[ "$machine" == "Linux" ]]; then
        sudo apt-cache search $@
    elif [[ "$machine" == "Darwin" ]]; then
        brew search $@
    else
        echo "Unknown OS: $machine"
    fi
}



