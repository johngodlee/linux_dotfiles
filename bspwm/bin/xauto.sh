#!/usr/bin/env sh

intern=LVDS1
extern=VGA1

if xrandr | grep "$extern disconnected"; then
	xrandr --output "$extern" --off --output "$intern" --auto
	feh --randomize --bg-scale ~/wallpapers/*
	bspc monitor -g 1024x600+0+0
    ~/.config/bspwm/./bspwmrc

else 
	xrandr --output "$intern" --off --output "$extern" --mode 1920x1080 --scale 1x1
	feh --randomize --bg-scale ~/wallpapers/*
	bspc monitor -g 1920x1080+0+0
    ~/.config/bspwm/./bspwmrc
fi
	
