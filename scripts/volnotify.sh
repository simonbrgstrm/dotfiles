#!/usr/bin/env bash
if [ $# -ne 1 ]; then
    echo "Need 1 argument (volup, voldown, volmute)"
    exit 1;
fi
getvol () {
    CURVOL=$(pactl list sinks | grep RUNNING -A 8 | tail -1 | awk '{print $5}' | sed -e 's/%//')
    if [ "$(pactl list sinks  | grep Mute | awk '{print $2}')" = 'yes' ]; then
        echo "Muted"
        return
    fi
}
if [ "$1" = 'volup' ]; then
    MSG='Volume up'
    getvol
elif [ "$1" = 'voldown' ]; then
    MSG='Volume down'
    getvol
elif [ "$1" = 'volmute' ]; then
    echo "Mute"
    if [ "$(pactl list sinks  | grep Mute | awk '{print $2}')" = 'yes' ]; then
        MSG='Mute'
    else
        MSG='Unmute'
    fi
    getvol
fi
notify-send "$MSG ($CURVOL%)"
# Om man vill ha nå gött sound till 
#paplay /usr/share/sounds/freedesktop/stereo/trash-empty.oga
