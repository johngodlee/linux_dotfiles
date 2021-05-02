#!/usr/bin/env sh

cache=$(cat ~/.gui_apps.cache)

choice=$(printf '%s\n' $cache | dmenu -i -p "Apps")

[ "$?" = "0" ] && exec $choice


