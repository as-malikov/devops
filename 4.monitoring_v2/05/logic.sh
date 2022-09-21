#!/bin/bash

log_file_logs=(nginx_1.log nginx_2.log nginx_3.log nginx_4.log nginx_5.log)
input_parameter=${1}

sort_request_status_code() {
    i=0
    while [ ${i} -lt 5 ]
    do
        < "../04/${log_file_logs[$i]}" awk '{print $0}'| sort -k 8
        i=$(( $i + 1 ))
    done
}

uniq_ip() {
    i=0
    while [ ${i} -lt 5 ]
    do
        < "../04/${log_file_logs[$i]}" sort | uniq -u |awk '{print $1}'
        i=$(( $i + 1 ))
    done
}

request_with_error() {
    i=0
    while [ ${i} -lt 5 ]
    do
        < "../04/${log_file_logs[$i]}" awk '($8 ~ /40*/ || $8 ~ /50*/)' | awk '{print $0}'
        i=$(( $i + 1 ))
    done
}

error_uniq_ip() {
    i=0
    while [ ${i} -lt 5 ]
    do
        < "../04/${log_file_logs[$i]}" awk '($8 ~ /40*/ || $8 ~ /50*/)' | awk '{print $1}'| sort | uniq -u
        i=$(( $i + 1 ))
    done
}

case ${input_parameter} in
    1)
        sort_request_status_code
        ;;
    2)
        uniq_ip
        ;;
    3)
        request_with_error
        ;;
    4)
        error_uniq_ip
esac