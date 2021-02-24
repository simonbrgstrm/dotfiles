#!/bin/bash

dot=~/dotfiles
log_file=~/install_progress_log.txt

sudo rm -rf ~/.vim/autoload > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.SpaceVim.d/init.toml > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.config/dunst/dunstrc > /dev/null 2>&1
sudo rm -rf ~/.config/herbstluftwm/autostart > /dev/null 2>&1
sudo rm -rf ~/.config/polybar > /dev/null 2>&1
sudo rm -rf ~/.config/ranger/rc.conf > /dev/null 2>&1


ln -sf $dot/vim/autoload ~/.vim/autoload
ln -sf $dot/vim/.vimrc ~/.vimrc
ln -sf $dot/spacevim/init.toml ~/.SpaceVim.d/init.toml
ln -sf $dot/zsh/.zshrc ~/.zshrc
ln -sf $dot/dunst/dunstrc ~/.config/dunst/dunstc
ln -sf $dot/herbstluftwm/autostartOrange ~/.config/herbstluftwm/autostart
ln -sf $dot/polybar ~/.config/polybar
ln -sf $dot/ranger/rc.confr ~/.config/ranger/rc.conf



