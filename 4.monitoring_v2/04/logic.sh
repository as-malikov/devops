#!/bin/bash

log_status_code=( 200 201 400 401 403 404 500 501 502 503 )
log_method=(GET POST PUT PATCH DELETE)
log_date="$(shuf -i 10-28 -n 1)/$(shuf -i 10-12 -n 1)/20$(shuf -i 10-22 -n 1)"
log_time_hh=$(shuf -i 10-20 -n 1)
log_time_mm=$(shuf -i 10-59 -n 1)
log_time_ss=$(shuf -i 10-59 -n 1)
log_agent=(Mozilla "Google Chrome" Opera Safari "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")
log_zone=(ru com site org shop online moscow bar press info)
log_file_logs=(nginx_1.log nginx_2.log nginx_3.log nginx_4.log nginx_5.log)
i=0
while [ ${i} -lt  $(shuf -i 100-1000 -n 1) ]
do
    log_ip="$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1).$(shuf -i 1-255 -n 1)"
    log_time="${log_time_hh}:${log_time_mm}:${log_time_ss}"
    log_time_ss=$((log_time_ss + 1))
    log_url="$(tr -dc '[:alnum:]' < /dev/urandom | dd bs=2 count=2 2>/dev/null)"
    if [ $log_time_ss -eq 60 ]
    then
      log_time_ss=10
      log_time_mm=$((log_time_mm + 1))
      if [ $log_time_mm -eq 60 ]
      then
        log_time_mm=10
        log_time_hh=$((log_time_hh + 1))
      fi
    fi
    log_request="${log_method[$(shuf -i 0-4 -n 1)]} https://$log_url.${log_zone[$(shuf -i 0-9 -n 1)]} HTTP/1.1"
    log_status_shuf="${log_status_code[$(shuf -i 0-9 -n 1)]}"
    log_agent_shuf="${log_agent[$(shuf -i 0-7 -n 1)]}"
    echo -e "$log_ip - - [$log_date:$log_time] \"$log_request\" $log_status_shuf $log_agent_shuf" >> "${log_file_logs[$1]}"   
    i=$(( $i + 1 ))
done