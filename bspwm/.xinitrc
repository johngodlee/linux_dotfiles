#!/bin/sh

xrdb ~/.Xresources &
xsetroot -cursor_name left_ptr &

feh --randomize --bg-tile ~/.wallpapers/* &
sxhkd &
exec bspwm
