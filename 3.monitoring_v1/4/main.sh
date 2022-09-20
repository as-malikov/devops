#!/bin/bash

    source info.sh

    if ! [ -n "$1" ]; then

        source param.conf

        reg="^[1-6]$"

		# column1_background 
        if ! [[ $column1_background =~ $reg ]]; then
                column1_background=6
                bc1="default"
        else
                bc1=$column1_background
        fi	
		# column1_font_color
        if ! [[ $column1_font_color =~ $reg ]]; then
                column1_font_color=1
                fc1="default"
        else
                fc1=$column1_font_color
        fi
		# column2_background
        if ! [[ $column2_background =~ $reg ]]; then
                column2_background=2
                bc2="default"
        else
                bc2=$column2_background
        fi
		#column2_font_color
        if ! [[ $column2_font_color =~ $reg ]]; then
                column2_font_color=4
                fc2="default"
        else
                fc2=$column2_font_color
        fi

        if [ "$column1_background" -ne "$column1_font_color" ] && [ "$column2_background" -ne "$column2_font_color" ]; then
            # (1 - white, 2 - red, 3 - green, 4 - blue, 5 – purple, 6 - black)
            color_font=("no" "\033[37m" "\033[31m" "\033[32m" "\033[34m" "\033[35m" "\033[30m")
            color_background=("no" "\033[47m" "\033[41m" "\033[42m" "\033[44m" "\033[45m" "\033[40m")
            ./color_file.sh ${color_font[$column1_font_color]} ${color_background[$column1_background]} ${color_font[$column2_font_color]} ${color_background[$column2_background]}

            echo ""
            color=("no" "white" "red" "green" "blue" "purple" "black")
            echo "Column 1 background = $bc1 (${color[$column1_background]})"
            echo "Column 1 font color = $fc1 (${color[$column1_font_color]})"
            echo "Column 2 background = $bc2 (${color[$column2_background]})"
            echo "Column 2 font color = $fc2 (${color[$column2_font_color]})"
        else
            echo -e "\033[35marg font = arg bachground. Input correct arg...\033[0m"
        fi
    else
        echo -e "\033[31mInput number [1-6] in param.conf!\033[0m"
    fi