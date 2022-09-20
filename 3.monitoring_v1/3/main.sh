#!/bin/bash

    source info.sh

    if [ -n  "$4" ] && ! [ -n "$5" ]; then
	reg="^[1-6]$"
	if [[ "$1" =~ $reg ]] && [[ "$2" =~ $reg ]] && [[ "$3" =~ $reg ]] && [[ "$4" =~ $reg  ]]; then
		if [ "$1" -ne "$2" ] && [ "$3" -ne "$4" ]; then
        		# (1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black)
        		color_font=("no" "\033[37m" "\033[31m" "\033[32m" "\033[34m" "\033[35m" "\033[30m")
        		color_background=("no" "\033[47m" "\033[41m" "\033[42m" "\033[44m" "\033[45m" "\033[40m")
        		./color_file.sh ${color_font[$1]} ${color_background[$2]} ${color_font[$3]} ${color_background[$4]}
		else
			echo -e "\033[35marg font = arg bachground. Input correct arg...\033[0m"
		fi
	else
		echo -e "\033[32mInput number [1-6]!\033[0m"
	fi
    else
        echo -e "\033[31mInput 4 arg!\033[0m"
    fi
