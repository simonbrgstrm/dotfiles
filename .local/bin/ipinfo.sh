#!/bin/bash

echo "IP-info: Get information from ip adress"
echo -n "Type ip adress: ";
read IP;
curl https://ipinfo.io/${IP}
