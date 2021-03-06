#!/bin/bash
# _            _         _  _
#|_| ___  ___ | |_  ___ | || |
#| ||   ||_ -||  _|| .'|| || |
#|_||_|_||___||_|  |__,||_||_|
# ____________________________


log_file=${PWD}/installResults.txt

apt=(
  #gnome-shell-extension-pixelsaver
  alacritty
  arandr
  blueman
  bluez
  brightnessctl
  cmake
  compton
  deepin-screenshot
  dmenu
  docker-compose
  docker.io
  dunst
  feh
  filezilla
  font-manager
  fzf
  gnome-tweaks
  herbstluftwm
  httpie
  jq
  libasound2-dev
  libcairo2-dev
  libcurl4-openssl-dev
  libiw-dev
  libmpdclient-dev
  libpulse-dev
  libxcb-composite0-dev
  libxcb-cursor-dev
  libxcb-ewmh-dev
  libxcb-icccm4-dev
  libxcb-image0-dev
  libxcb-randr0-dev
  libxcb-util0-dev
  libxcb-xkb-dev
  libxcb-xrm-dev
  mlocate
  nodejs
  npm
  pavucontrol
  python
  python3
  python3-pip
  python3-xcbgen
  ranger
  rofi
  speedtest-cli
  spotify-client
  vagrant
  vim
  virt-manager
  virtualbox
  xcb
  xcb-proto
  zsh

) 

## Add apt repos
sudo add-apt-repository universe
sudo add-apt-repository multiverse

## Install curl
sudo apt install -y curl

## Docker key/repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"


## Spotify key/repo
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

## Update
sudo apt update

## Installs from apt array
for install in ${apt[@]};
do
  sudo apt install -y $install
  if [[ $? > 0 ]];
  then
    echo "$install FAILED" >> $log_file
  else
    echo "$install installed" >> $log_file
  fi
done

## Create herbstluftwm dir
mkdir -p ~/.config/herbstluftwm

## Install SpaceVim
curl -sLf https://spacevim.org/install.sh | bash

## Spicetify-cli
curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh

## Docker permission 
sudo usermod -aG docker $USER 

## Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

## Install Starship
wget -O starshipinstall.sh https://starship.rs/install.sh
chmod +x starshipinstall.sh && ./starshipinstall.sh -f 
rm starshipinstall.sh

## Downloads polybar
wget https://github.com/polybar/polybar/releases/download/3.5.5/polybar-3.5.5.tar.gz
tar -C ~/ -zxvf polybar-3.5.5.tar.gz

## Print logfile
echo -e "\n------ *** ------\n"
echo
grep -E 'FAILED|$' $log_file
#cat $log_file
echo
echo -e "\n------ *** ------\n"
rm $log_file
