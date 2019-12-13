#!/bin/sh

Clock () {
	date '+%Y-%m-%d %H:%M:%S'
}

while true; do
	echo -e "%{r}$(Clock)"
	sleep 1s
done
