#!/usr/bin/env zsh

waittime="300"

while true
do
	clear
	timew > tw.txt
	notify-send-all.sh -t 10000 "Currently Tracking" "$(head -n 1 tw.txt)"
	timew
	rm -r tw.txt
	sleep "$waittime"
done

