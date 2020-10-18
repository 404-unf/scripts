#!/usr/bin/env zsh

waittime="1200"

clear

while true
do
	VAR=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E "state|to\ full|percentage")
	 # | "$VAR"
	if [ -z "$VAR" ]
	then
		echo "Empty"
	else
		time=$(date +"%T")
		echo "$time"
		echo "$VAR"
		echo ""
		notify-send-all.sh -t 10000 "Battery Status" "$VAR"
	fi
	sleep "$waittime"
done
