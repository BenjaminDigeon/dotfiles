#!/bin/bash

used_ram=`top -l 1 | awk '/PhysMem/ {print $2}' | sed "s/M//"`
free_ram=`top -l 1 | awk '/PhysMem/ {print $6}' | sed "s/M//"`
let total_ram=$used_ram+$free_ram
used_percent=$(echo "scale=2; $used_ram / $total_ram * 100" | bc)
used_percent=`echo $used_percent | cut -d . -f 1`
free_ram=$(echo "scale=2; $free_ram / 1024" | bc)
let count=5

colour='\033[0;32m'
printf "RAM ["
while [ $count -le 100 ]
do
  if [ $used_percent -ge $count ]
  then
    if [ $used_percent -le 50 ]
    then
      printf "\033[1;32m|" # green
      colour='\033[0;32m'
    elif [ $used_percent -le 75 ]
    then
      printf "\033[1;33m|" # yellow
      colour='\033[0;33m'
    elif [ $used_percent -le 100 ]
    then
      printf "\033[1;31m|" # red
      colour='\033[0;31m'
    fi
  else
    printf "\033[0m "
  fi
  let count=${count}+5
done
printf "]"; echo $colour "\c"; printf "%2d%%" $used_percent
