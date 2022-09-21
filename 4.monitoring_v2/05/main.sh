#!/bin/bash
reg_number="^[1-4]{1}$"
input_parameter=${1}

if [ -n "$1" ] && ! [ -n "$2" ]; then
    if [[ ${input_parameter} =~ ${reg_number} ]]; then
        ./logic.sh ${input_parameter}
    else
        echo "Parameter error."
    fi
else
    echo "Incorrect count of parameters. You need to enter 1 parameter."
fi