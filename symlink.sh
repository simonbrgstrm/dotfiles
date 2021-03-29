#!/bin/bash
#                  _  _       _
# ___  _ _  _____ | ||_| ___ | |_
#|_ -|| | ||     || || ||   || '_|
#|___||_  ||_|_|_||_||_||_|_||_,_|
#     |___|                       
#__________________________________

dot=${PWD}

## Remove existing
sudo rm -rf ~/.SpaceVim.d > /dev/null 2>&1
sudo rm -rf ~/.config/dunst/dunstrc > /dev/null 2>&1
sudo rm -rf ~/.config/herbstluftwm/autostart > /dev/null 2>&1
sudo rm -rf ~/.config/polybar > /dev/null 2>&1
sudo rm -rf ~/.config/ranger/rc.conf > /dev/null 2>&1
sudo rm -rf ~/.local/share/fonts > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1

## Create dirs and paths
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/dunst
mkdir -p ~/.config/herbstluftwm
mkdir -p ~/.config/ranger
mkdir -p ~/.local/bin
mv ~/spicetify-cli ~/.config/spicetify > /dev/null 2>&1
PATH="$HOME/.local/bin/:$PATH"

## Make zsh default shell
chsh -s $(which zsh)

## Remove headerbar from terminal
#gnome-extensions enable pixel-saver@deadalnix.me
#gsettings set org.gnome.Terminal.Legacy.Settings headerbar false

## Symlink .config
ln -sf "$dot"/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sf "$dot"/.config/compton.conf ~/.config/compton.conf
ln -sf "$dot"/.config/dunst/dunstrc ~/.config/dunst/dunstc
ln -sf "$dot"/.config/espanso/default.yml ~/.config/espanso/default.yml
ln -sf "$dot"/.config/herbstluftwm/autostartOrange ~/.config/herbstluftwm/autostart
ln -sf "$dot"/.config/herbstluftwm/panel.sh ~/.config/herbstluftwm/panel.sh
ln -sf "$dot"/.config/polybar ~/.config/polybar
ln -sf "$dot"/.config/polybar ~/.config/polybar
ln -sf "$dot"/.config/ranger/rc.conf ~/.config/ranger/rc.conf
ln -sf "$dot"/.screenlayout ~/.screenlayout
ln -sf "$dot"/.config/spicetify/Themes/SpicetifyDefault/color.ini ~/.config/spicetify/Themes/SpicetifyDefault/color.ini
ln -sf "$dot"/.config/spicetify/Themes/SpicetifyDefault/user.css ~/.config/spicetify/Themes/SpicetifyDefault/user.css
ln -sf "$dot"/.config/spicetify/config.ini ~/.config/spicetify/config.ini
ln -sf "$dot"/.config/starship.toml ~/.config/starship.toml
ln -sf "$dot"/.zshrc ~/.zshrc
sudo ln -sf "$dot"/.config/rofi/onedark.rasi /usr/share/rofi/themes/onedark.rasi
sudo ln -sf "$dot"/.config/rofi/rofi.conf /etc/rofi.conf


## Symlink ./local/bin
ln -sf "$dot"/.local/bin/bosse.sh ~/.local/bin/bosse
ln -sf "$dot"/.local/bin/ipinfo.sh ~/.local/bin/ipinfo
ln -sf "$dot"/.local/bin/sshserver.sh ~/.local/bin/sshserver

## Fonts
ln -sf "$dot"/.local/share/fonts ~/.local/share/fonts
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
fc-cache -f -v

## SpaceVim
ln -sf "$dot"/.SpaceVim.d ~/.SpaceVim.d
ln -sf "$dot"/.SpaceVim.d/autoload ~/.SpaceVim.d/autoload
ln -sf "$dot"/.SpaceVim.d/theme/molokai.vim ~/.SpaceVim/autoload/SpaceVim/mapping/guide/theme/molokai.vim
ln -sf "$dot"/.SpaceVim.d/theme/onedark.vim ~/.SpaceVim/autoload/SpaceVim/mapping/guide/theme/onedark.vim


