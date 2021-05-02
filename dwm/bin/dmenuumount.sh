#!/bin/sh
# A dmenu prompt to unmount drives.
# Provides you with mounted partitions, select one to unmount.
# Drives mounted at /, /boot and /home will not be options to unmount.

unmountusb() {
	[ -z "$drives" ] && exit
	chosen=$(echo "$drives" | dmenu -i -p "Unmount which drive?" | awk '{print $1}')
	[ -z "$chosen" ] && exit
	sudo umount "$chosen" 
	}

drives=$(lsblk -nrpo "name,type,size,mountpoint" | awk '$2=="part"&&$4!~/\/boot|\/home$|SWAP/&&length($4)>1{printf "%s (%s)\n",$4,$3}')

if [ -z "$drives" ]; then
	echo "No drives to unmount." && exit
else
	echo "Unmountable USB drive detected."
	unmountusb
fi
