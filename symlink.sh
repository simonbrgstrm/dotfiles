#!/bin/bash
#                  _  _       _
# ___  _ _  _____ | ||_| ___ | |_
#|_ -|| | ||     || || ||   || '_|
#|___||_  ||_|_|_||_||_||_|_||_,_|
#     |___|                       
#__________________________________

set -e

dot=$(pwd)

# Remove existing files
rm -v ~/.SpaceVim.d || true
rm -v ~/.config/dunst/dunstrc || true
rm -v ~/.config/herbstluftwm/autostart || true
rm -v ~/.config/polybar/* || true
rm -v ~/.config/ranger/rc.conf || true
rm -v ~/.local/share/fonts/* || true
rm -v ~/.zshrc || true

# Create directories and paths
mkdir -p ~/.config/alacritty \
         ~/.config/dunst \
         ~/.config/herbstluftwm \
         ~/.config/ranger \
         ~/.local/bin

mv -v ~/spicetify-cli ~/.config/spicetify

PATH="$HOME/.local/bin/:$PATH"

# Make zsh the default shell
chsh -s "$(which zsh)"

# Symlink configuration files
declare -A files=(
  [alacritty.yml]=".config/alacritty/alacritty.yml"
  [compton.conf]=".config/compton.conf"
  [dunstrc]=".config/dunst/dunstrc"
  [default.yml]=".config/espanso/default.yml"
  [autostart]=".config/herbstluftwm/autostart"
  [panel.sh]=".config/herbstluftwm/panel.sh"
  [rc.conf]=".config/ranger/rc.conf"
  [screenlayout]=".screenlayout"
  [color.ini]=".config/spicetify/Themes/SpicetifyDefault/color.ini"
  [user.css]=".config/spicetify/Themes/SpicetifyDefault/user.css"
  [config.ini]=".config/spicetify/config.ini"
  [starship.toml]=".config/starship.toml"
  [zshrc]=".zshrc"
)

for file in "${!files[@]}"; do
  target="${files[$file]}"
  ln -sfv "$dot/$file" "$HOME/$target"
done

sudo ln -sfv "$dot/.config/rofi/onedark.rasi" /usr/share/rofi/themes/
