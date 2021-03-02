#!/bin/bash
# _            _         _  _
#|_| ___  ___ | |_  ___ | || |
#| ||   ||_ -||  _|| .'|| || |
#|_||_|_||___||_|  |__,||_||_|
# ____________________________


log_file=~/installResults.txt

apt=(
  curl
  docker-cie
  docker-ce-cli
  containerd.io
  vim
  zsh
  herbstluftwm
  npm
  nodejs
  python
  python3
  python-pip
  spotify-client

) 

## Add apt repos
sudo add-apt-repository universe
sudo add-apt-repository multiverse

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

## Install SpaceVim
curl -sLf https://spacevim.org/install.sh | bash

## Spicetify-cli
curl -fsSL https://raw.githubusercontent.com/khanhas/spicetify-cli/master/install.sh | sh

## Docker permission 
sudo usermod -aG docker $USER 

## Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

## Install Starship
curl -fsSL https://starship.rs/install.sh | bash

## Print logfile
echo -e "\n------ *** ------\n"
echo
cat $log_file
echo
echo -e "\n------ *** ------\n"
rm $log_file
