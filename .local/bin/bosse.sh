#!/bin/bash
# _                       
#| |_  ___  ___  ___  ___ 
#| . || . ||_ -||_ -|| -_|
#|___||___||___||___||___|
#_________________________                         

# Connectar/Disconnectar BOSS3 hörlurar
device="28:11:A5:DE:81:A4"

if bluetoothctl info "$device" | grep 'Connected: yes' -q; then
  bluetoothctl disconnect "$device"
else
  bluetoothctl connect "$device"
fi
