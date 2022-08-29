#!/bin/bash
my_mac="28:11:A5:DE:81:A4"
mac="${my_mac//:/_}"

dbus-send --print-reply=literal --system --dest=org.bluez /org/bluez/hci0/dev_${mac} org.freedesktop.DBus.Properties.Get string:"org.bluez.Battery1" string:"Percentage" | awk '{print "🎧" $3 "%"}'
