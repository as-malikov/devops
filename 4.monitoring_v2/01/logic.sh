#!/bin/bash

file_path=${1}
date_log=$(date +'%Y_%m_%d_%T')
date_name=$(date +'%d%m%y')
log_file_path="$(pwd)/${date_log}.log"
name_folder=${3}
IFS="." read -r -a MY_ARR <<< "$5"
name_file=${MY_ARR[0]}
extension_file=${MY_ARR[1]}

cd ${file_path} || exit

case ${#name_folder} in
    1)
        name_folder+=${name_folder}${name_folder}${name_folder}
        ;;

    2)
        name_folder+=${name_folder}
        ;;
    3)
        name_folder+=${name_folder:0-1}
esac


case ${#name_file} in
    1)
        name_file+=${name_file}${name_file}${name_file}
        ;;
    2)
        name_file+=${name_file}
        ;;
    3)
        name_file+=${name_file:0-1}
esac

name_folder_with_date=${name_folder}_${date_name}
name_file_temp=${name_file}


i=0
while [ ${i} -lt ${2} ]
do
    name_folder_with_date=${name_folder}_${date_name}
    mkdir ${name_folder_with_date}
    cd ${name_folder_with_date}
    name_folder+=${name_folder:0-1}
    name_file=${name_file_temp}
    echo "CREATE_FOLDER: $(pwd) $(date +'%Y_%m_%d_%T')" >> ${log_file_path}
    j=0
    while [ ${j} -lt ${4} ]
    do
        free_size=$(df -h / | grep / | awk '{printf "%d", $4}')
        if [ "${free_size}" != "1" ]
        then
            truncate -s ${6:0:(${#6} - 1)} "${name_file}_${date_name}.${extension_file}"
            echo "    CREATE_FILE - $(pwd)/${name_file}_${date_name}.${extension_file} $(date +'%Y_%m_%d_%T') ${6}" >> ${log_file_path}
            name_file+=${name_file:0-1}
        else
            exit
        fi
        j=$(( $j + 1 ))
    done
    cd ..
    i=$(( $i + 1 ))
done
