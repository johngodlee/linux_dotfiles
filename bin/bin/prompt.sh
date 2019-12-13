#!/bin/sh

# Generic dmenu binary prompt

[ $(echo -e "No\nYes" | dmenu -i -p "$1") == "Yes" ] && $2
