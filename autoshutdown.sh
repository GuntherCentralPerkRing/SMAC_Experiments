#!/bin/bash
PID="$1"

if [ -z "$PID" ]; then
    echo "用法: $0 <进程PID>"
    exit 1
fi

if ! ps -p "$PID" > /dev/null 2>&1; then
    echo "错误: PID $PID 不存在"
    exit 1
fi

echo "开始监控 PID: $PID"

while ps -p "$PID" > /dev/null 2>&1; do
    sleep 10
done

echo "$(date '+%Y-%m-%d %H:%M:%S') 进程 $PID 已结束，5分钟后关机"
sudo shutdown -h +5


# lookup for PID
# ps aux | grep main.py



# nohup ./autoshutdown.sh ###PID > /tmp/monitor.log 2>&1 &
# nohup ./autoshutdown.sh 4546 > /tmp/monitor.log 2>&1 &
# nohup ./autoshutdown.sh 38538 > /tmp/monitor.log 2>&1 &

# cat /tmp/monitor.log
# cancel shutdown if needed
# pkill -f autoshutdown.sh


# git add xxx
# git commit -m ""
# git pull
# git push