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
    pactl set-sink-volume 0 +2%
    MSG='Volume up'
    getvol
elif [ "$1" = 'voldown' ]; then
    pactl set-sink-volume 0 -2%
    MSG='Volume down'
    getvol
elif [ "$1" = 'volmute' ]; then
    echo "Mute"
    pactl set-sink-mute 0 toggle
    if [ "$(pactl list sinks  | grep Mute | awk '{print $2}')" = 'yes' ]; then
        MSG='Mute'
    else
        MSG='Unmute'
    fi
    getvol
fi
notify-send -t 2000 "$MSG ($CURVOL%)" -h string:x-canonical-private-synchronous:anything
# Om man vill ha nå gött sound till 
#paplay /usr/share/sounds/freedesktop/stereo/trash-empty.oga
