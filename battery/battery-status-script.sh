#!/usr/bin/env zsh

waittime="600"

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
		# notify-send-all.sh -t 2000 "Battery Status" "$VAR"
		notify-send-all.sh -t 5000 "$VAR"
	fi
	sleep "$waittime"
done
