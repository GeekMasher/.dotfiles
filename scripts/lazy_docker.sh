#!/bin/bash
if [ -f "./scripts/myfuncs.sh" ]; then
    source ./scripts/myfuncs.sh
elif [ -f "./myfuncs.sh" ]; then
    source ./myfuncs.sh
fi

# References:
# - https://docs.docker.com/install/linux/docker-ce/ubuntu/#set-up-the-repository
# - https://docs.docker.com/install/linux/linux-postinstall/


# debian
if osContains 'Ubuntu'; then
    banner "Install Ubuntu addition..."

    requiresRoot
    # cleanup old installs if present
    sudo apt-get remove docker docker-engine docker.io

    sudo apt-get update -y
    sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y

    # download and install ket
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

    # update and install
    sudo apt-get update -y
    sudo apt-get install docker-ce -y

    # create group and add current user to docker group
    sudo groupadd docker
    sudo usermod -aG docker $USER
    banner "Please logout (or reboot) to be able to use from current user..."

elif osContains 'Debian'; then
    banner "Install Debain addition..."

    requiresRoot
    # cleanup old installs if present
    sudo apt-get remove docker docker-engine docker.io

    sudo apt-get update
    sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common
    
    # download and install ket
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

    # update and install
    sudo apt-get update
    sudo apt-get install docker-ce

    # create group and add current user to docker group
    sudo groupadd docker
    sudo usermod -aG docker $USER

    banner "Please logout (or reboot) to be able to use from current user..."
else
    echo "The Operating system isn't supported for lazy docker"
fi


# # test install worked
# docker run hello-world
