#!/bin/bash
#                  _  _       _
# ___  _ _  _____ | ||_| ___ | |_
#|_ -|| | ||     || || ||   || '_|
#|___||_  ||_|_|_||_||_||_|_||_,_|
#     |___|                       
#__________________________________

dot=${PWD}

## Remove existing
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.SpaceVim.d > /dev/null 2>&1
sudo rm -rf ~/.config/dunst/dunstrc > /dev/null 2>&1
sudo rm -rf ~/.config/herbstluftwm/autostart > /dev/null 2>&1
sudo rm -rf ~/.config/polybar > /dev/null 2>&1
sudo rm -rf ~/.config/ranger/rc.conf > /dev/null 2>&1

## Create dirs and paths
mkdir -p ~/.local/bin
mkdir -p ~/.config/herbstluftwm
mkdir -p ~/.config/dunst
mkdir -p ~/.config/ranger
mv ~/spicetify-cli ~/.config/spicetify
PATH="$HOME/.local/bin/:$PATH"

## Make zsh default shell
chsh -s $(which zsh)

## Remove headerbar from terminal
#gnome-extensions enable pixel-saver@deadalnix.me
#gsettings set org.gnome.Terminal.Legacy.Settings headerbar false

## Symlink .config
ln -sf $dot/.zshrc ~/.zshrc
ln -sf $dot/.config/dunst/dunstrc ~/.config/dunst/dunstc
ln -sf $dot/.config/herbstluftwm/autostartOrange ~/.config/herbstluftwm/autostart
ln -sf $dot/.config/polybar ~/.config/polybar
ln -sf $dot/.config/ranger/rc.confr ~/.config/ranger/rc.conf
ln -sf $dot/.config/espanso/default.yml ~/.config/espanso/default.yml
ln -sf $dot/.config/spicetify/config.ini ~/.config/spicetify/config.ini
ln -sf $dot/.config/spicetify/Themes/SpicetifyDefault/color.ini ~/.config/spicetify/Themes/SpicetifyDefault/color.ini
ln -sf $dot/.config/spicetify/Themes/SpicetifyDefault/user.css ~/.config/spicetify/Themes/SpicetifyDefault/user.css
ln -sf $dot/.config/starship.toml ~/.config/starship.toml
ln -sf $dot/.config/polybar ~/.config/polybar
sudo ln -sf $dot/.config/rofi/rofi.conf /etc/rofi.conf
sudo ln -sf $dot/.config/rofi/onedark.rasi /usr/share/rofi/themes/onedark.rasi


## Symlink ./local/bin
ln -sf $dot/.local/bin/ipinfo.sh ~/.local/bin/ipinfo
ln -sf $dot/.local/bin/sshserver.sh ~/.local/bin/sshserver
ln -sf $dot/.local/bin/bosse.sh ~/.local/bin/bosse

## Symlink ./local/share
ln -sf $dot/.local/share/fonts ~/.local/share/fonts

## SpaceVim
ln -sf $dot/.SpaceVim.d ~/.SpaceVim.d
ln -sf $dot/.SpaceVim.d/autoload ~/.SpaceVim.d/autoload
ln -sf $dot/.SpaceVim.d/theme/molokai.vim ~/.SpaceVim/autoload/SpaceVim/mapping/guide/theme/molokai.vim
ln -sf $dot/.SpaceVim.d/theme/onedark.vim ~/.SpaceVim/autoload/SpaceVim/mapping/guide/theme/onedark.vim


