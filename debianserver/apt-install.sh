#!/usr/bin/env bash

readarray -t apt < packages.txt
log_file=${PWD}/install-log.txt

for install in "${apt[@]};"
do
  sudo apt-get install -y "$install"
  if [[ $? -ne 0 ]];
  then
    echo "$install FAILED" >> "$log_file"
  else
    echo "$install installed" >> "$log_file"
  fi
done
