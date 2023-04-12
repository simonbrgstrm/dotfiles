#!/bin/bash

EDITOR="alacritty -e lvim"

declare -A options
options[Alacritty]="$HOME/.config/alacritty/alacritty.yml"
options[Aliases]="$HOME/dotfiles/shell/.alias"
options[Compton]="$HOME/.config/compton.conf"
options[Dunst]="$HOME/.config/dunst/dunstrc"
options[Espanso]="$HOME/.config/espanso/default.yml"
options[Herbstluftwm]="$HOME/.config/herbstluftwm/autostart"
options[Lunarvim]="$HOME/.config/lvim/config.lua"
options[Neovim]="$HOME/.config/nvim/init.vim"
options[Polybar]="$HOME/.config/polybar/config.ini"
options[Ranger]="$HOME/.config/ranger/rc.conf"
options[Rofi]="$HOME/.config/rofi/config"
options[Spacevim]="$HOME/.SpaceVim.d/init.toml"
options[Tmux]="$HOME/.tmux.conf"
options[Zsh]="$HOME/.zshrc"

# Print and pipe array to rofi
choice=$(printf '%s\n' "${!options[@]}" | rofi -dmenu -i -no-sidebar-mode -p "Configmenu") 

# Open selected file with editor
if [ "$choice" ]; then
	conf=$(printf '%s\n' "${options["${choice}"]}")
	$EDITOR "$conf"
fi
