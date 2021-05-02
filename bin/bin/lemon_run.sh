#!/bin/sh

PANEL_FIFO=/tmp/panel-fifo
PANEL_HEIGHT=20

# setup
if [ $(pgrep -cx panel) -gt 1 ] ; then
  printf "%s\n" "The panel is already running." >&2
  exit 1
fi

trap 'trap - TERM; kill 0' INT TERM QUIT EXIT

[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"

bspc config top_padding $PANEL_HEIGHT
bspc control --subscribe > "$PANEL_FIFO" &

# clock
while true; do
    echo 'C' $(date '+%Y-%m-%d %H:%M:%S');
    sleep 1s
done > "$PANEL_FIFO" &

# battery
while true; do
	BATS=$(cat /sys/class/power_supply/BAT0/status)
	BATC=$(cat /sys/class/power_supply/BAT0/capacity)
	if [ "$BATS" = "Charging" ]; then
		echo 'B' "C"
	else
		echo 'B' "$BATC"
	fi
	sleep 60s
done > "$PANEL_FIFO" &

# alsa volume
while true; do
	ALSA_VOL=$(amixer -c 0 get Master | tail -n 1 | awk -F '[][]' '{print $2}')
	echo 'V' $ALSA_VOL
	sleep 1s
done > $PANEL_FIFO &

# wifi
while true; do
	ETH=$(cat /sys/class/net/enp1s0/operstate)
	if [ "$ETH" = "up" ]; then
		echo 'L' "Ethernet"
	else
		WIFI=$(iw dev wlp2s0 link | grep "SSID" | awk '{print $2}')
		echo 'L' "$WIFI"
	fi
	sleep 10s
done > $PANEL_FIFO &

# Window manager
while true; do
	CUR=$(bspc query -D -d focused --names)
	TOT=$(bspc query -D | wc -l)
	echo 'W' "$CUR/$TOT"
	sleep 5s
done > $PANEL_FIFO &

cat "$PANEL_FIFO" | lemon_config.sh | lemonbar -B "#292d3e" -F "#bbc5ff" | sh &

wait
