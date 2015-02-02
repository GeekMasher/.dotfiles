#!/bin/bash

# Created by GeekMasher to help with the problem of updating
# a Linux distro without having to do much work

if [ "$EUID" -ne 0 ]		# check if your running as root
  then echo "[...] Please run as root."
  exit
fi

error=false	# error check var

	# Debian/Ubuntu Support
which apt-get > /dev/null && {
	echo "[...] Patching using 'apt-get'"
	# -qq : Only show errors
	apt-get update 2> error=true
	apt-get upgrade 2> error=true
	apt-get dist-upgrade 2> error=true
}
	# Arch support
which pacman > /dev/null && {
	echo "[...] Patching using 'pacman'."
	pacman -Syu 2> error=true
}
	# Void Linux (Arch based) support
which xbps-install > /dev/null && {
	echo "[...] Pacthing using 'xbps'"
	xbps-install -S 2> error=true
	xbps-install -u 2> error=true
}
	# CentOS Support (Needs testing)
which yum > /dev/null && {
	echo "[...] Patching using 'yum'"
	su -c 'yum update' 2> error=true
}

# Error
if [ "$error" = true ] ; then
    echo '[...] An Error occurred during patching process.'
fi
# Finished patching
echo "[...] Patching complete"
exit
