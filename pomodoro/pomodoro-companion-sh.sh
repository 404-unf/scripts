#!/usr/bin/env bash

clear
FILE=/home/terra9/.terra9config/pomodoro-time.txt

while true
do
	if test -f "$FILE"; then
		data=$(head -n 1 $FILE)
		notify-send-all.sh -t 6000 "$data remains..."
		echo "$data remains..."
	fi
	sleep 120
done

