#!/bin/bash
CORES=`nproc`
LIM=`echo - | awk -v i="$CORES" '{print i * 8 / 10}'` # Limit 80% CPU cores total usage
while true
do
  CUR_LA=`cat /proc/loadavg | cut -d" " -f 1` # current LA for 5 minutes
  LIM_LA=`echo - | awk -v i="$CUR_LA" '{print i * 8 / 10}'` # 80% from current LA value
  if awk "BEGIN {exit !($LIM_LA >= $LIM)}"; then
   echo "Load average is high (`cat /proc/loadavg`) on $HOSTNAME" | mail -s "HIGH LOAD AVERAGE" root
  fi
sleep 300
done
