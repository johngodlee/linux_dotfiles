#!/bin/sh

xrdb merge ~/.Xresources
xsetroot -cursor_name left_ptr &

feh --randomize --bg-scale ~/wallpapers/* &
sxhkd &
$HOME/bin/lemon_config.sh | lemonbar -f monospace-18 -B "#292d3e" &
exec bspwm
