#!/usr/bin/env sh

[ -f ~/.Xresources ] && xrdb -merge -I$HOME ~/.Xresources

$HOME/.fehbg &

while true ; do
	LOCALTIME=$(date +%Y-%m-%d\ \[%H:%M\]\ \(%Z\))
	xsetroot -name "$LOCALTIME"
done &

exec dwm
