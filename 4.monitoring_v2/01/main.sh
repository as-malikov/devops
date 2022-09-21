#!/bin/bash

reg_count_folder="^[[:digit:]]+$"
reg_name_folder="^([[:upper:]]|[[:lower:]]){1,7}$"
reg_count_file="^[[:digit:]]+$"
reg_name_file="^([[:upper:]]|[[:lower:]]){1,7}\.{1}([[:upper:]]|[[:lower:]]){1,3}$"
reg_size_file="^([1-9]|[1-9]{1}[0-9]{1}|100)(KB|Kb|kb)$"

if [ -n "$6" ] && ! [ -n "$7" ]; then
    if [[ "$2" =~ $reg_count_folder ]] && [[ "$3" =~ $reg_name_folder ]] \
        && [[ "$4" =~ $reg_count_file ]] && [[ "$5" =~ $reg_name_file ]] \
        && [[ "$6" =~ $reg_size_file ]] 
        then
            ./logic.sh "$1" "$2" "$3" "$4" "$5" "$6"
    else
        echo "Parameter error."
    fi
else
    echo "Incorrect number of parameters. You need to enter 6 parameters."
fi
