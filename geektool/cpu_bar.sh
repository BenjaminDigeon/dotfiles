#!/bin/bash

free=`top -l 2 | grep "CPU usage" | tail -1 | awk '{printf "%.0f", $7+0}'`
let used=100-$free

printf "CPU ["
let count=5; colour='\033[0;32m'
while [ $count -le 100 ]
do
  if [ $used -ge $count ]
  then
    if [ $used -le 50 ]
    then
      printf "\033[1;32m|" # green
      colour='\033[0;32m'
    elif [ $used -le 75 ]
    then
      printf "\033[1;33m|" # yellow
      colour='\033[0;33m'
    elif [ $used -le 100 ]
    then
      printf "\033[1;31m|" # red
      colour='\033[0;31m'
    fi
  else
    printf "\033[0m "
  fi
  let count=${count}+5
done
printf "]"; echo $colour "\c"; printf "%2d%%" $used
