#!/bin/bash

log_file=~/install_progress_log.txt

apt=(
  vim
  zsh
  herbstluftwm
  npm
  nodejs
  python
  python3
  python-pip
  curl

) 

## Add apt repos
sudo add-apt-repository universe
sudo add-apt-repository multiverse
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

## Install docker the right way
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER 

## Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"



## Print logfile
echo -e "\n------ *** ------\n"
echo
cat $log_file
echo
echo -e "\n------ *** ------\n"
rm $log_file
