#!/usr/bin/env bash
clear
while true
do
	read -p "Pomodoro 25 or 10? (25 or 10) " answer

	case $answer in
		25 ) notify-send-all.sh -t 10000 "Pomodoro 25 Timer has started..."
			time=$(date +"%T")
			echo "Pomodoro 25 Timer started @ $time"
			sleep 1500
			echo "Pomodoro 25 Timer stopped @ $time"
			notify-send-all.sh -t 10000 "Pomodoro 25 Timer has stopped..."
			;;
		10 ) notify-send-all.sh -t 10000 "Pomodoro 10 Timer has started..."
			time=$(date +"%T")
			echo "Pomodoro 10 Timer started @ $time"
			sleep 600
			echo "Pomodoro 10 Timer stopped @ $time"
			notify-send-all.sh -t 10000 "Pomodoro 10 Timer has stopped..."
			;;
		* ) echo "Enter the correct option!!!"
	esac
done

