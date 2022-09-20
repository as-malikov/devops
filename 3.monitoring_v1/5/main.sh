#!/bin/bash

reg="/$"

if [ -n  "$1" ] && ! [ -n "$2" ]; then
    if [[ "$1" =~ $reg ]] && [ -d "$1" ]; then
        TIMEFORMAT="Script execution time (in seconds) = %R"
        time {
            source info.sh "$1"
            ./run.sh
        }
    else
        echo -e "\033[31mThe end of the path must end with a character '/' or path = DIR\033[0m"
    fi
else
    echo -e "\033[31mInput correct arg!\033[0m"
fi