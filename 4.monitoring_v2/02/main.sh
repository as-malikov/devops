#!/bin/bash

reg_name_folder="^([[:upper:]]|[[:lower:]]){1,7}$"
reg_name_file="^([[:upper:]]|[[:lower:]]){1,7}\.{1}([[:upper:]]|[[:lower:]]){1,3}$"
reg_size_file="^([1-9]|[1-9]{1}[0-9]{1}|100)(MB|Mb|mb)$"

date_log=$(date +'%Y_%m_%d')
log_file_path="$(pwd)/${date_log}.log"

TIMEFORMAT="# total main.sh: %lR"
time {
    TIMEFORMAT="# total main.sh: %lR"
    time {
        start=$(date +'%T')
        if [ -n "$3" ] && ! [ -n "$4" ]; then
            if [[ "$1" =~ $reg_name_folder ]] && [[ "$2" =~ $reg_name_file ]] \
            && [[ "$3" =~ $reg_size_file ]]
                then
                    ./logic.sh "$1" "$2" "$3" "$log_file_path"
            else
                echo "Parameter error."
            fi
        else
            echo "Incorrect number of parameters. You need to enter 3 parameters."
        fi

        finish=$(date +'%T')
        echo "# start main.sh: ${start}"
        echo "# finish main.sh: ${finish}"
        echo "# start main.sh: ${start}" >> ${log_file_path}
        echo "# finish main.sh: ${finish}" >> ${log_file_path}
    }
} 2>> ${log_file_path}