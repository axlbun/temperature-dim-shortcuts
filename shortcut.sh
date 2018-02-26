#!/usr/bin/env bash

read bright < `dirname $0`/bright.txt
read temp < `dirname $0`/temp.txt

case $1 in
	brightup)
			if (($bright < 91)); then 
			bright=$((bright+10))
			echo $bright > `dirname $0`/bright.txt
			fi
		;;
	brightdown)
			if (($bright > 10)); then 
			bright=$((bright-10))
			echo $bright > `dirname $0`/bright.txt
			fi		
		;;
	tempup)
			if (($temp < 10000 )); then 
			temp=$((temp + 500))
			echo $temp > `dirname $0`/temp.txt
			fi
		;;
	tempdown)
			if (($temp > 1499 )); then 
			temp=$((temp - 500))
			echo $temp > `dirname $0`/temp.txt
			fi	
		;;
	*)
		echo "Wrong parameter. Try bright_up, bright_down, temp_up or temp_down"
	
esac

`dirname $0`/iris-micro.sh $temp $bright

#If you don't want notifications, comment this line
notify-send "$bright $temp" -t 200

$SHELL