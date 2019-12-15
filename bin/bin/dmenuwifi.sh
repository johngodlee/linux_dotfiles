#!/bin/sh


ETH=$(cat /sys/class/net/enp1s0/operstate)

if [ "$ETH" = "up" ]; then
	echo "Connected to ethernet"
else
	SSID=$(sudo iw dev wlp2s0  scan | grep "SSID:" | awk '{$1=""; print $0}' | dmenu -i -p "Connect to network:" | xargs)
	PASS=$(echo "" | dmenu -i -p "WiFi password:")

	if [ -z "$PASS" ]; then
		nmcli device wifi connect "$SSID"
	else
		nmcli device wifi connect "$SSID" password "$PASS"
	fi	
fi
