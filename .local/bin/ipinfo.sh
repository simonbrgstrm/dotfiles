#!/bin/bash
# _       _       ___
#|_| ___ |_| ___ |  _| ___
#| || . || ||   ||  _|| . |
#|_||  _||_||_|_||_|  |___|
#   |_|                    
#___________________________

echo "IP-info: Get information from ip adress"
echo -n "Type ip adress: ";
read IP;
curl https://ipinfo.io/${IP}
