#!/bin/bash

if [[ "$@" = *"kubernetes"* ]]; then
    if osContains 'Ubuntu'; then
        banner "Installing Kubernetes..."
        sudo apt-get update && sudo apt-get install -y apt-transport-https
        curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
        echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
        sudo apt-get update
        sudo apt-get install -y kubectl
    elif osContains 'Debian'; then
        banner "Currently not supported for Debian..."
    fi
fi
