#!/usr/bin/env bash

waittime="2"

previousWindowName=""

while [[ true ]]; do
	
	windowName=$(xdotool getwindowfocus getwindowname)
	
	if [ "$previousWindowName" != "$windowName" ] 
	then
		time=$(date)
		# echo "$time" >> /home/terra9/.terra9config/active-window-log.txt
		echo "$time  ||   $windowName" >> /home/terra9/.terra9config/active-window-log.txt
		# echo "$time"
		echo "$time  ||   $windowName"
		echo "" >> /home/terra9/.terra9config/active-window-log.txt
		echo ""
		previousWindowName=$windowName
	fi
	sleep "$waittime"
done
