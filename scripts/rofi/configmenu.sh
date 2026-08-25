#!/usr/bin/env bash

if command -v lvim >/dev/null 2>&1; then
	editor="lvim"
elif command -v nvim >/dev/null 2>&1; then
	editor="nvim"
else
	editor="${EDITOR:-vi}"
fi

declare -A options
options[Alacritty]="$HOME/.config/alacritty/alacritty.yml"
options[Aliases]="$HOME/.config/zsh/zsh-aliases"
options[Compton]="$HOME/.config/compton.conf"
options[Dunst]="$HOME/.config/dunst/dunstrc"
options[Espanso]="$HOME/.config/espanso/default.yml"
options[Herbstluftwm]="$HOME/.config/herbstluftwm/autostart"
options[Lunarvim]="$HOME/.config/lvim/config.lua"
options[Neovim]="$HOME/.config/nvim/init.lua"
options[Polybar]="$HOME/.config/polybar/config.ini"
options[Ranger]="$HOME/.config/ranger/rc.conf"
options[Rofi]="$HOME/.config/rofi/config"
options[Tmux]="$HOME/.tmux.conf"
options[Zsh]="$HOME/.zshrc"

# Print and pipe array to rofi
choice=$(printf '%s\n' "${!options[@]}" | rofi -dmenu -i -no-sidebar-mode -p "Configmenu") 

# Open selected file with editor
if [ "$choice" ]; then
	conf=$(printf '%s\n' "${options["${choice}"]}")
	if command -v "${TERMINAL:-alacritty}" >/dev/null 2>&1; then
		"${TERMINAL:-alacritty}" -e "$editor" "$conf"
	else
		"$editor" "$conf"
	fi
fi
