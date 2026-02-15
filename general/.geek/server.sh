#!/bin/bash

# vpn commands
alias vpn="sudo /usr/sbin/openvpn && ip.dns"

# server commands
alias connect="ssh $@ -t 'tmux a -t main || tmux new -s main'"

smount(){
    if [ ! -d $1 ]; then; mkdir -p $1; fi
    # TODO: Mount server dir
    sshfs -p $SERVER_EXT_PORT -o allow_other $SERVER_EXT_USER@$SERVER_EXT_IP:$SERVER_EXT_RDIR $SERVER_EXT_DIR
}

sumount() {
    umount $@
}

