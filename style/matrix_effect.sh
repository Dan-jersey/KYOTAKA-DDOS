#!/bin/bash
echo -e "\e[32m"
clear
while :
do
  echo $RANDOM | md5sum | fold -w 80 | head -n 1
  sleep 0.05
done
