#!/usr/bin/env bash

battery=$(cat /sys/class/power_supply/BAT0/capacity)
if [ "$battery" -le 15 ]
then
    echo "#[fg=$color_red] 🔋${battery}%"
elif [[ "$battery" -gt 15 && "$battery" -le 35 ]]
then
     echo "#[fg=$color_yellow] 🔋${battery}%"
else
    echo "#[fg=$color_info_text] 🔋${battery}%"
fi
