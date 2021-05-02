#!/usr/bin/env sh

[ -f ~/.Xresources ] && xrdb -merge -I$HOME ~/.Xresources

$HOME/.fehbg &

while true ; do
	LOCALTIME=$(date +%Z\=%Y-%m-%dT%H:%M)
	xsetroot -name "$LOCALTIME"
done &


exec dwm
