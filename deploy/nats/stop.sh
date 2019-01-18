#!/bin/bash
#
# nats停止脚本
# 

path=`pwd`

cd ${path}
if [ -f nats.pid ]; then
    nats_process_id=`cat nats.pid`
    kill -9 ${nats_process_id} && sleep 1
    judge_nats=`ps xf | grep "^${nats_process_id}[[:space:]]" | wc -l`
    if [ ${judge_nats} -eq 0 ]; then
        echo "停止NATS成功" && rm -f nats.pid && exit 0
    else
        echo "停止NATS失败" && exit 0
    fi
else
    echo "当前目录没有nats.pid文件，停止失败" && exit 0
fi
