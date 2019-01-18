#!/bin/bash
# stop script

pid_file=${1}.pid
if [ ! -f ${pid_file} ]; then 
	echo "not exist ${pid_file}" && exit 10
fi

pid=`cat ${pid_file}`
number=`ps -p ${pid} | grep ${pid} | wc -l`
if [ ${number} -eq 0 ]; then 
	echo "$1 Not running" && exit 10
else 
	kill -15 ${pid}; code=$?
	if [ ${code} -eq 0 ]; then
	    flag="false"
	    for i in 1 2 3; do
	        number=`ps -p ${pid} | grep ${pid} | wc -l`
	        if [ ${number} -eq 0 ]; then
	            flag="true"
	            break
	        fi
	        sleep 1
		done
		if [ ${flag} == "true" ]; then
		    echo "Stop Service Successfully" && rm -rf ${pid_file}
		else
		    echo "Stop Service failed" && exit 10
		fi
	else
		echo "Stop Service failed" && exit 10
	fi
fi


