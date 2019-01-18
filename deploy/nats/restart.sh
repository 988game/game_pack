#!/bin/bash
#
# nats重启脚本
# 

if [ ! -f stop.sh ]; then 
    echo '没有停止脚本stop.sh' && exit 1
fi 

if [ ! -f start.sh ]; then 
    echo '没有启动脚本start.sh' && exit 1
fi 

chmod u+x stop.sh && chmod u+x start.sh 

./stop.sh && sleep 2 && ./start.sh 
