#!/usr/bin/env bash
clear

countdown(){
	hour=$1
	min=$2
	sec=$3
	        while [ $hour -ge 0 ]; do
	                while [ $min -ge 0 ]; do
	                        while [ $sec -ge 0 ]; do
	                                echo -ne "$hour:$min:$sec\033[0K\r"
	                                echo "$hour:$min:$sec" > /home/terra9/.terra9config/pomodoro-time.txt
	                                let "sec=sec-1"
	                                sleep 1
	                        done
	                        sec=59
	                        let "min=min-1"
	                done
	                min=59
	                let "hour=hour-1"
	        done
	rm /home/terra9/.terra9config/pomodoro-time.txt
}

while true
do
	read -p "Pomodoro 25 or 10? (25 or 10) " answer

	case $answer in
		25 ) notify-send-all.sh -t 10000 "Pomodoro 25 Timer has started..."
			time=$(date +"%T")
			echo "Pomodoro 25 Timer started @ $time"
			countdown 0 25 0
			time=$(date +"%T")
			echo "Pomodoro 25 Timer stopped @ $time"
			notify-send -u "critical" "Pomodoro 25 Timer has stopped..."
			;;
		10 ) notify-send-all.sh -t 10000 "Pomodoro 10 Timer has started..."
			time=$(date +"%T")
			echo "Pomodoro 10 Timer started @ $time"
			countdown 0 10 0
			time=$(date +"%T")
			echo "Pomodoro 10 Timer stopped @ $time"
			notify-send -u "critical" "Pomodoro 10 Timer has stopped..."
			;;
		* ) echo "Enter the correct option!!!"
	esac
done
