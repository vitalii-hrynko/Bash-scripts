#!/bin/bash
read -p "Enter a path to log file: " LOG
GREEN='\033[0;32m'
NC='\033[0m'
if [ -f $LOG ]; then
  echo " "
  echo -e "${GREEN}Top 10 URLs by quantity of client errors(4хх): "
  echo -e "${NC} "
  cat $LOG | awk '{ if($9 ~ /4[0-9][0-9]/ ) { print $7, $9} }' | sort | uniq -c | sort -nr | head -n10 | awk '{print $1, $3, $2}'
  echo " "
  echo -e "${GREEN}Top 10 URLs by quantity of client and server errors(4хх, 5хх): "
  echo -e "${NC} "
  cat $LOG | awk '{ if($9 ~ /[4-5][0-9][0-9]/ ) { print $7, $9} }' | sort | uniq -c | sort -nr | head -n10 | awk '{print $1, $3, $2}'
  echo " "
  echo -e "${GREEN}Top 10 URLs by quantity of server errors(5хх): "
  echo -e "${NC} "
  cat $LOG | awk '{ if($9 ~ /5[0-9][0-9]/ ) { print $7, $9} }' | sort | uniq -c | sort -nr | head -n10 | awk '{print $1, $3, $2}'
else
  echo "There is no such file. Try again"
fi