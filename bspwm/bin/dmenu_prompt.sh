#!/usr/bin/env sh

# Binary prompt in dmenu
[ $(echo "No\nYes" | dmenu -i -p "$1") == "Yes" ] && $2
