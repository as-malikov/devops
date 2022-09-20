#!/bin/bash

if ! [ -n "$1" ]; then
    source info.sh
    ./info_to_file.sh
    read -r -p "Write data to file? [y/n]" response
    if [ "$response" = "Y" ] || [ "$response" = "y" ]; then
        fname="$(date +'%d_%m_%y_%T').status"
        touch "$fname"
        ./info_to_file.sh >> $fname
    fi
else
    echo "incorrect argument"
fi