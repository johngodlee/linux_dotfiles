#!/bin/sh

# Gives a dmenu prompt to mount unmounted drives. If
# they're in /etc/fstab, they'll be mounted automatically. Otherwise, you'll
# be prompted to give a mountpoint from already existsing directories. If you
# input a novel directory, it will prompt you to create that directory.

getmount() { \
	[ -z "$chosen" ] && exit 1
	mp="$(find $1 2>/dev/null | dmenu -i -p "Type in mount point.")"
	[ "$mp" = "" ] && exit 1
	if [ ! -d "$mp" ]; then
		mkdiryn=$(printf "No\\nYes" | dmenu -i -p "$mp does not exist. Create it?")
		[ "$mkdiryn" = "Yes" ] && sudo mkdir -p "$mp"
	fi
	}

mountusb() { \
	chosen="$(echo "$usbdrives" | dmenu -i -p "Mount which drive?" | awk '{print $1}')"
	sudo -A mount "$chosen" 2>/dev/null && exit 0
	alreadymounted=$(lsblk -nrpo "name,type,mountpoint" | awk '$2=="part"&&$3!~/\/boot|\/home$|SWAP/&&length($3)>1{printf "-not \\( -path *%s -prune \\) \\ \n",$3}')
	getmount "/mnt /media /mount /home -maxdepth 5 -type d $alreadymounted"
	partitiontype="$(lsblk -no "fstype" "$chosen")"
	case "$partitiontype" in
		"vfat") sudo -A mount -t vfat "$chosen" "$mp" -o rw,umask=0000;;
		*) sudo -A mount "$chosen" "$mp"; user="$(whoami)"; ug="$(groups | awk '{print $1}')"; sudo -A chown "$user":"$ug" "$mp";;
	esac
	}

usbdrives="$(lsblk -rpo "name,type,size,mountpoint" | awk '$2=="part"&&$4==""{printf "%s (%s)\n",$1,$3}')"

if [ -z "$usbdrives" ]; then
	echo "No USB drive detected" && exit
else
	echo "USB drive(s) detected."
	mountusb
fi
