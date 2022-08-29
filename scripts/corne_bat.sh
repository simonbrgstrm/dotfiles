#!/bin/bash
my_mac="C9:2A:D6:53:19:13"
mac="${my_mac//:/_}"

dbus-send --print-reply=literal --system --dest=org.bluez /org/bluez/hci0/dev_${mac} org.freedesktop.DBus.Properties.Get string:"org.bluez.Battery1" string:"Percentage" | awk '{print "⌨  " $3 "%"} '
