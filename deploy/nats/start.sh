#!/bin/bash
#
# nats 启动脚本
# pid 文件是 nats.pid

path=`pwd`

host_name=`hostname`
nats_config="nats.${host_name}.conf"

cd ${path}
if [ ! -f "nats-streaming-server" ]; then 
    echo '没有启动文件: nats-streaming-server' && exit 0
fi 
chmod u+x nats-streaming-server

if [ -f nats.pid ]; then
    nats_process_id=`cat nats.pid`
    judge_nats=`ps xf | grep "^${nats_process_id}[[:space:]]" | wc -l`
    if [ ${judge_nats} -ne 0 ]; then
        echo "启动失败, nats已运行" && exit 0
    else
        rm -f nats.pid
    fi
fi

if [ -f ${nats_config} ]; then 
    ./nats-streaming-server -c ${nats_config} -cid nats.${host_name} -pid nats.pid 2>/dev/null &
else 
    ./nats-streaming-server  -p 8111 -m 8222 -pid nats.pid 2>/dev/null &
fi
sleep 3

judge_start=`ps xf | grep nats-streaming-server | grep -v grep | wc -l`
if [ ${judge_start} -ne 0 ]; then 
    echo "启动nats成功"
else
    echo '启动nats失败'
fi 