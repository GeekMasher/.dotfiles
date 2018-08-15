#!/bin/bash

banner() {
    echo "===================="
    echo "    > $1"
    echo "===================="
}

banner_error() {
    echo "[!!!] $1"
} 

requiresRoot() {
    if [[ $EUID -ne 0 ]]; then
        echo "This script must be run as root" 
        exit 1
    fi
}

osContains() {
    OS=`uname -a`
    if [[ $OS = *"$1"* ]]; then
        return 0
    else
        return 1
    fi
}

getHome() {
    if [ -d "$PWD/home" ]; then
        echo "$PWD/home/$@"
    elif [ -d "$PWD/../home" ]; then
        echo "$PWD/../home/$@"
    fi
}

checksum() {
    CWD=$(pwd)
    cd "$(dirname $1)"
    sha256sum --check "$(basename $1)" | grep "OK"
    if [[ "$?" = 1 ]]; then
        cd $CWD
        return 0
    else
        cd $CWD
        return 1
    fi
}

