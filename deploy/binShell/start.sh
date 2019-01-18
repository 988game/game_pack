#!/bin/bash

# set GOTRACEBACK to generate core file
export GOTRACEBACK=crash
new_time=`date +%Y%m%d%H%M`

if [ ! -f ${1} ]; then
        echo "${1} Not exist" && exit 10
fi
if [ ! -d ./out ]; then
	mkdir ./out
fi
pid_file=${1}.pid
if [ ! -f ${pid_file} ]; then
        nohup ./$1 $2 1> ./out/$1_${new_time}.out 2> ./out/$1_${new_time}.out & pid=$!
        echo $pid > $1.pid && echo "Running succeed, PID ${pid}"
else
        pid=`cat ${pid_file}`
        number=`ps -p ${pid} | grep ${pid} | wc -l`
        if [ ${number} -eq 0 ]; then
                nohup ./$1 $2 1> ./out/$1_${new_time}.out 2> ./out/$1_${new_time}.out & pid=$!
                echo $pid > $1.pid && echo "Running succeed, PID ${pid}"
        else
                echo "Running failed, $1 running already, PID is ${pid}" && exit 10
        fi
fi

