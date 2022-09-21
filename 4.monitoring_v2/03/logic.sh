#!/bin/bash

input_parameter=${1}
date_log=$(date +'%Y_%m_%d')
log_file_path="../02/${date_log}.log"

# echo $log_file_path

clear_for_log() {
    while read -r path_folder
    do
        clear_path="$(echo ${path_folder} | grep CREATE_FOLDER: | awk '{print $2}')"
        if [ -d ${clear_path} ]; then
            rm -rf ${clear_path}
        fi
    done < "${log_file_path}"
}

clear_for_time() {
    declare -a start_date finish_date start_time finish_time
    read -p ">>> input start date & time (YY_MM_DD HH:MM): " -r start_date start_time
    read -p ">>> input finish data & time(YY_MM_DD HH:MM): " -r finish_date finish_time

    reg_date="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])"
    reg_time="(^[0-1]{1}[0-2]{1}|[0]{1}[0-9]{1}):([0-5]{1}[0-9]{1})$"

    if [[ ${start_date} =~ ${reg_date} ]] && [[ ${start_time} =~ ${reg_time} ]] \
        && [[ ${finish_date} =~ ${reg_date} ]] && [[ ${finish_time} =~ ${reg_time} ]]
        then
            clear_path="$(grep PATH ${log_file_path} | awk '{print $2}')"
            clear_path+="/"
            find / -type d -newerct "${start_date} ${start_time}" ! -newerct "${finish_date} ${finish_time}" \
            | grep "${clear_path}" >> rm_file
    else
        echo "Error input"
    fi

    while read -r path_folder
    do 
        clear_path="$(echo "$path_folder" | awk '{print $1}')"
        # echo "### ${clear_path}"
        if [ -d "$clear_path" ] 
        then 
            rm -rf "$clear_path"
        fi
    done < "rm_file"
    # $(rm rm_file)
}

case ${input_parameter} in
    1)
        clear_for_log
        ;;
    2)
        clear_for_time
        ;;
    3)
       find / -name "*_$(date +'%d%m%y')" -type d -exec rm -rf {} + 2>/dev/null
esac