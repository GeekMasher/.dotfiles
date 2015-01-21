#!/bin/bash

# Created by GeekMasher to help with the problem of updating
# a Linux distro without having to do much work

	# Debian/Ubuntu Support
which apt-get > /dev/null && {
	echo "[...] Patching using 'apt-get'"
	# -qq : Only show errors
	sudo apt-get -qq update
	sudo apt-get -qq upgrade
	sudo apt-get -qq dist-upgrade
}
	# Arch support
which pacman > /dev/null && {
	echo "[...] Patching using 'pacman'."
	sudo pacman -Syu # > /dev/null
}
	# Void Linux (Arch based) support
which xbps-install > /dev/null && {
	echo "[...] Pacthing using 'xbps'"
	sudo xbps-install -S
	sudo xbps-install -u
}
	# CentOS Support (Needs testing)
which yum > /dev/null && {
	echo "[...] Patching using 'yum'"
	su -c 'yum update'
}

# Finished patching
echo "[...] Patching complete"
