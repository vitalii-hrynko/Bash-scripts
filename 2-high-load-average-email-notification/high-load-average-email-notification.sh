#!/bin/bash
CORES=`nproc`
LA=`cat /proc/loadavg | cut -d" " -f 1 | cut -d"." -f 1`
while true
do
  if (( 0,8*$LA >= $CORES  )); then
   echo "Load average is high (`cat /proc/loadavg`) on $HOSTNAME" | mail -s "HIGH LOAD AVERAGE" root
  else
   echo "It's ok"
  fi
sleep 300
done