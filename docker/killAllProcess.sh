#!/bin/bash

PORTS=(8080,9200,9202,9100,9300,9203,9201,9204)  # 定义端口列表

# shellcheck disable=SC2068
for port in ${PORTS[@]}; do
    result=`echo $(lsof -i:$port | grep LISTEN | awk '{print $2}')`
    if [[ "$result" != "" ]];then
        echo "正在停止端口[$port]的进程...."
        kill -9 $result
    fi
done
