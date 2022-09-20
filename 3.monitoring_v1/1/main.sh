#!/bin/bash

regex="^[+-]?[0-9]+([.][0-9]+)?$"

if [ -n "$1" ] && ! [ -n "$2" ] && ! [[ "$1" =~ $regex ]]; then
    echo $1
else
    echo "Incorrect input "
fi