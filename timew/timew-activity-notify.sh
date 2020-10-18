#!/usr/bin/env zsh

waittime="300"
clear 

while true
do
	date
	timew > tw.txt
	notify-send-all.sh -t 10000 "Currently Tracking" "$(head -n 1 tw.txt)"
	data=$(timew)
	echo "   $data"
	echo ""
	rm -r tw.txt
	sleep "$waittime"
done

