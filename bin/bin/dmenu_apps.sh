#!/bin/sh


cache=$(cat bin/gui_apps.cache)

choice=$(printf '%s\n' $cache | dmenu -i -p "Apps")

[ "$?" = "0" ] && exec $choice


