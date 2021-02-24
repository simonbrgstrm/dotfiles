#!/bin/bash

dotfiles=~/dotfiles
log_file=~/install_progress_log.txt

sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.SpaceVim.d > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.config/dunst/dunstrc > /dev/null 2>&1

ln -sf $dotfiles/vim ~/.vim
ln -sf $dotfiles/vim/.vimrc ~/.vimrc
ln -sf $dotfiles/spacevim/init.toml ~/.SpaceVim.d/init.toml
ln -sf $dotfiles/zsh/.zshrc ~/.zshrc
ln -sf $dotfiles/dunst/dunstrc ~/.config/dunst/dunstc
