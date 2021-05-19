#!/usr/bin/env bash

uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown="Shutdown"
reboot="Restart"
lock="Lock"
suspend="Sleep"
logout="Logout"

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(printf "$options" | rofi -dmenu "$@" -p "UP - $uptime")"
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

