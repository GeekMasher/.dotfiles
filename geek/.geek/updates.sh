#!/bin/bash 

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
distoOut="$(lsb_release -si)"
case "${distoOut}" in
    Ubuntu*)    distro=Ubuntu;;
    Pop*)       distro=PopOS;;
    Debian*)    distro=Debian;;
    *)          distro=""
esac

# Base commands
if [[ "$distro" =~ ^(Ubuntu|PopOS|Debian)$ ]]; then
    alias deb-install="sudo dpkg -i $1 && sudo apt install -f"
fi

update() {
    if [[ "$machine" == "Linux" ]]; then
        if [[ "$distro" =~ ^(Ubuntu|PopOS|Debian)$ ]]; then
            sudo apt update -y 
        else 
            echo "Unknown Distro / Package Manager"
        fi

    elif [[ "$machine" == "Mac" ]]; then
        brew update
    else
        echo "Unknown OS: $machine"
    fi
}

upgrade() {
    if [[ "$machine" == "Linux" ]]; then
        if [[ "$distro" =~ ^(Ubuntu|PopOS|Debian)$ ]]; then
            echo "Updating apt..."
            sudo apt upgrade -y 
            sudo apt dist-upgrade -y
            sudo apt autoremove -y 
            sudo apt autoclear -y
        else 
            echo "Unknown Distro / Package Manager"
        fi
        
        # Flatpak
        if [[ -x "$(flatpak)" ]]; then
            flatpak update
        fi
    elif [[ "$machine" == "Darwin" ]]; then
        echo "Updating brew..."
        brew update 
        brew upgrade 
        # Generate a lock file
        brew bundle dump --force
        brew cleanup
    else
        echo "Unknown OS: $machine"
    fi

    if [[ -d "$HOME/.cargo/" ]]; then
        echo "Updating rust..."
        rustup update
    fi
    if [[ -d "$HOME/.nvm/" ]]; then
        echo "Updating node..."
        nvm install node
    fi
}

install() {
    # Update first before search
    update 

    if [[ "$machine" == "Linux" ]]; then
        if [[ "$distro" =~ ^(Ubuntu|PopOS|Debian)$ ]]; then
            sudo apt install -y "$*"
        fi
    elif [[ "$machine" == "Darwin" ]]; then
        brew install "$*"
    else
        echo "Unknown OS: $machine"
    fi
}

search() {
    if [[ "$machine" == "Linux" ]]; then
        if [[ "$distro" =~ ^(Ubuntu|PopOS|Debian)$ ]]; then
            sudo apt-cache search "$*"
        fi
    elif [[ "$machine" == "Darwin" ]]; then
        brew search "$*"
    else
        echo "Unknown OS: $machine"
    fi
}



