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
	eth=$(cat /sys/class/net/enp1s0/operstate)
	if [ "$eth" = "up" ]; then
		echo "Ethernet"
	else
		iw dev wlp2s0 link | grep "SSID" | awk '{print $2}'
	fi
}

Desktop () {	
	cur=$(bspc query -D -d focused --names)
	tot=$(bspc query -D | wc -l)

	echo "$cur/$tot"
}



sep=" | "

while true; do
	printf "%s\n" "%{l} $(Desktop)%{r}$(Wifi)$sep$(Bat)$sep$(Clock) "
	sleep 1s
done
