#!/usr/bin/env bash

waittime="21600"
clear
while [[ true ]]; do
	#statements
	echo "Up since $(uptime -s)"
	# uptime -s
	uptime -p
	echo ""
	uptime -p > uptime.txt
	notify-send-all.sh -t 4000 "$(head -n 1 uptime.txt) "
	rm -rf uptime.txt
	sleep "$waittime"
done
