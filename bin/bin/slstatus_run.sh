#!/bin/bash

print_date(){
	date "+%a %m-%d %T%:::z"
}

while true; do
	xsetroot -name "$(print_date)"

	sleep 10
done
