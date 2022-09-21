#!/bin/bash

number="^(1|2|3)$"
input_parameter="${1}"

if [ -n "$1" ] && ! [ -n "$2" ]; then
    if [[ ${input_parameter} =~ ${number} ]]; then
        ./logic.sh ${1}
    else
        echo "Parameter error."
    fi
else
    echo "Incorrect number of parameters. You need to enter 1 parameter."
fi
