#!/usr/bin/env zsh

waittime="300"
clear 

while true
do
	date
	timew > tw.txt
	# notify-send-all.sh -t 2000 "Currently Tracking" "$(head -n 1 tw.txt)"
	head -n 1 tw.txt >> head-tail.txt
	tail -n 1 tw.txt >> head-tail.txt
	notify-send-all.sh -t 4000 "$(head -n 2 head-tail.txt) "
	data=$(timew)
	echo "   $data"
	echo ""
	rm -r tw.txt
	rm -r head-tail.txt
	sleep "$waittime"
done

