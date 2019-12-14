#!/bin/sh

Clock () {
	date '+%Y-%m-%d %H:%M:%S'
}

Bat () {
	BATS=$(cat /sys/class/power_supply/BAT0/status)
	BATC=$(cat /sys/class/power_supply/BAT0/capacity)
	if [ "$BATS" = "Charging" ]; then
		echo "C"
	else
		echo "$BATC"
	fi
}

Wifi () {
	iw dev wlp2s0 link | grep "SSID" | awk '{print $2}'
}

sep=" | "

while true; do
	printf "%s\n" "%{l}%{r}$(Wifi)$sep$(Bat)$sep$(Clock) "
	sleep 1s
done

