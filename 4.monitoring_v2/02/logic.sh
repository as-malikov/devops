#!/bin/bash

log_file_path=${4}
date_d_m_y=$(date +'%d%m%y')
name_folder=${1}
IFS="." read -r -a MY_ARR <<< "$2"
name_file=${MY_ARR[0]}
extension_file=${MY_ARR[1]}
do_not="^*(SBIN|BIN|sbin|bin)"
folder_path=""
# check for min 5 characters "name_folder"
case ${#name_folder} in
    1)
        name_folder+=${name_folder}${name_folder}${name_folder}
        ;;
    2)
        name_folder+=${name_folder}
        ;;
    3)
        name_folder+=${name_folder:0-1}
        ;;
    4)
        name_folder+=${name_folder:0-2}
esac
# check for min 5 characters "name_file"
case ${#name_file} in
    1)
        name_file+=${name_file}${name_file}${name_file}
        ;;
    2)
        name_file+=${name_file}
        ;;
    3)
        name_file+=${name_file:0-1}
        ;;
    4)
        name_file+=${name_file:0-2}
esac

while [[ ${do_not} =~ ${folder_path} ]]
do
    folder_path=$(find / -type d 2> /dev/null | shuf -n 1)
done

cd ${folder_path} || exit

# name_folder_with_date=${name_folder}_${date_d_m_y}
name_file_temp=${name_file}

echo "PATH ${folder_path}" >> ${log_file_path}

i=0
while [ ${i} -lt $(shuf -i 1-100 -n 1) ]
do
    name_folder_with_date="${name_folder}_${date_d_m_y}"
    mkdir ${name_folder_with_date}
    cd ${name_folder_with_date} || exit
    name_folder+=${name_folder:0-1}
    name_file=${name_file_temp}
    echo "CREATE_FOLDER: $(pwd) $(date +'%Y-%m-%d %H:%M:%S')" >> ${log_file_path}
    j=0
    while [ ${j} -lt $(shuf -i 1-100 -n 1) ]
    do
        free_size=$(df -h / | grep / | awk '{printf "%d", $4}')
        if [[ "${free_size}" != "1" && "${free_size}" != "0" ]]
        then
            fallocate -l "$3" "${name_file}_${date_d_m_y}.${extension_file}"
            echo "    CREATE_FILE - $(pwd)/${name_file}_${date_name}.${extension_file} $(date +'%Y-%m-%d %H:%M:%S') ${3}" >> ${log_file_path}
            name_file+=${name_file:0-1}
        else
            exit
        fi
        j=$(( $j + 1 ))
    done
    echo "## COUNT_FILE: $(( ${j} - 1 )) in ##" >> ${log_file_path}
    echo " " >> ${log_file_path}
    cd ..
    i=$(( $i + 1 ))
done

echo "#### COUNT_FOLDER: $(( ${i} - 1 )) in ####" >> ${log_file_path}
