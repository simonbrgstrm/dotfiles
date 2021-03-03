#!/bin/bash
# _            _         _  _
#|_| ___  ___ | |_  ___ | || |
#| ||   ||_ -||  _|| .'|| || |
#|_||_|_||___||_|  |__,||_||_|
# ____________________________


log_file=${PWD}/installResults.txt

apt=(
  docker-compose
  docker.io
  dunst
  herbstluftwm
  gnome-tweaks
  rofi
  dmenu
  nodejs
  gnome-shell-extension-pixelsaver
  fzf
  npm
  mlocate
  python
  python-pip
  python3
  ranger
  spotify-client
  vim
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
done

## Check installation and sends result to logfile
for check in ${apt[@]}; do
  if type -p $check > /dev/null;
  then
    echo "$check installed" >> $log_file
  else
    echo "$check failed" >> $log_file
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

## Print logfile
echo -e "\n------ *** ------\n"
echo
grep -E 'failed|$' $log_file
#cat $log_file
echo
echo -e "\n------ *** ------\n"
rm $log_file
