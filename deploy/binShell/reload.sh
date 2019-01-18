#!/bin/bash
# reload script

pid_file=${1}.pid
if [ ! -f ${pid_file} ]; then
        echo "not exist ${pid_file}" && exit 10
fi
pid=`cat ${pid_file}`

kill -s USR1 ${pid} && echo "Reload config successfully" || echo "Reload config Failed"