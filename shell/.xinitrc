#!/bin/sh

xrdb merge ~/.Xresources
xsetroot -cursor_name left_ptr &

feh --randomize --bg-scale ~/wallpapers/* &
sxhkd &
exec bspwm
