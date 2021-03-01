#!/bin/bash
#                  _  _       _
# ___  _ _  _____ | ||_| ___ | |_
#|_ -|| | ||     || || ||   || '_|
#|___||_  ||_|_|_||_||_||_|_||_,_|
#     |___|                       
#__________________________________

dot=~/dotfiles

## Remove existing
sudo rm -rf ~/.vim/autoload > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.SpaceVim.d/init.toml > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.config/dunst/dunstrc > /dev/null 2>&1
sudo rm -rf ~/.config/herbstluftwm/autostart > /dev/null 2>&1
sudo rm -rf ~/.config/polybar > /dev/null 2>&1
sudo rm -rf ~/.config/ranger/rc.conf > /dev/null 2>&1

## Symlink .config
ln -sf $dot/vim/autoload ~/.vim/autoload
ln -sf $dot/.vimrc ~/.vimrc
ln -sf $dot/.zshrc ~/.zshrc
ln -sf $dot/.SpaceVim.d/init.toml ~/.SpaceVim.d/init.toml
ln -sf $dot/.config/dunst/dunstrc ~/.config/dunst/dunstc
ln -sf $dot/.config/herbstluftwm/autostartOrange ~/.config/herbstluftwm/autostart
ln -sf $dot/.config/polybar ~/.config/polybar
ln -sf $dot/.config/ranger/rc.confr ~/.config/ranger/rc.conf
ln -sf $dot/.config/espanso/default.yml ~/.config/espanso/default.yml

## Symlink ./local/bin
ln -sf $dot/.local/bin/ipinfo.sh ~/.local/bin/ipinfo
ln -sf $dot/.local/bin/sshserver.sh ~/.local/bin/sshserver
ln -sf $dot/.local/bin/bosse.sh ~/.local/bin/bosse



