#!/bin/bash

dotfiles_dir=~/dotfiles
log_file=~/install_progress_log.txt

sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1

ln -sf $dotfiles_dir/vim ~/.vim
ln -sf $dotfiles_dir/vim/vimrc ~/.vimrc
ln -sf $dotfiles_dir/bashrc ~/.bashrc
ln -sf $dotfiles_dir/zsh/zshrc ~/.zshrc
