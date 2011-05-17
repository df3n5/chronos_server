#!/bin/bash

echo "Enter task to accomplish:"
read task
echo $task >> ~/.tasks

TIME=`ctc --m b`
tput sc
ISFINISHED="0"


while [ 1 ]
do
	sleep 1
	TIME=`ctc --m c`
	STATUS=`ctc --m s`
	tput el1
	tput rc
	echo -n $TIME $STATUS
	if [[ ("$STATUS" == "CT_STATE_Finished") && ($ISFINISHED == "0") ]]
	then
		zenity --info --title="Time's Up" --text="${*:-BING}"
		ISFINISHED="1"
	fi
done
