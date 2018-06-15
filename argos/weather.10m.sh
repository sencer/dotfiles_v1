#!/bin/bash

IFS=$'\n' data=($(curl -s wttr.in/?0QT|awk '{print substr($0,16,length($0)-15)}'))

if echo "$data"|grep -q moment; then
  echo "_"
  echo "---"
  echo "Out of service|href='http://wttr.in'"
else
  echo ${data[1]:-_}
  echo "---"
  echo "${data[0]}|href='http://wttr.in'"
  echo "${data[1]} ${data[2]}"
  echo "${data[3]} ${data[4]}"
fi
