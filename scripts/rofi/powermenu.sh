#!/bin/bash

rofi_command="rofi -show run"

uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown="Shutdown"
reboot="Restart"
lock="Lock"
suspend="Sleep"
logout="Logout"

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
        exec shutdown
        ;;
    $reboot)
        exec reboot
        ;;
    $lock)
        exec i3lock-fancy
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        logout
        ;;
esac

