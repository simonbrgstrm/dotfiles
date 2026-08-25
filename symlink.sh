#!/usr/bin/env bash

set -Eeuo pipefail
IFS=$'\n\t'

readonly SCRIPT_DIR="$(cd -- "$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")" && pwd)"
readonly BACKUP_ROOT="$HOME/.dotfiles-backups"
readonly BACKUP_DIR="$BACKUP_ROOT/$(date +%Y%m%d-%H%M%S)"

backup_created=0

declare -a LINKS=(
  ".cocrc:.cocrc"
  ".screenlayout:.screenlayout"
  ".tmux.conf:.tmux.conf"
  ".zshenv:.zshenv"
  ".zshrc:.zshrc"
  "vim:.vim"
  "vim/.vimrc:.vimrc"
  ".config/alacritty/alacritty.toml:.config/alacritty/alacritty.toml"
  ".config/betterlockscreen:.config/betterlockscreen"
  ".config/compton.conf:.config/compton.conf"
  ".config/compton.conf:.config/picom.conf"
  ".config/dunst:.config/dunst"
  ".config/espanso:.config/espanso"
  ".config/herbstluftwm:.config/herbstluftwm"
  ".config/kitty:.config/kitty"
  ".config/lvim:.config/lvim"
  ".config/neofetch:.config/neofetch"
  ".config/nvim:.config/nvim"
  ".config/polybar:.config/polybar"
  ".config/ranger:.config/ranger"
  ".config/rofi:.config/rofi"
  ".config/spicetify:.config/spicetify"
  ".config/starship.toml:.config/starship.toml"
  ".config/zsh:.config/zsh"
  ".local/bin/bosse.sh:.local/bin/bosse.sh"
  ".local/bin/ipinfo.sh:.local/bin/ipinfo.sh"
  ".local/bin/sshserver.sh:.local/bin/sshserver.sh"
)

backup_target() {
  local target="$1"
  mkdir -p "$BACKUP_DIR"
  local relative="${target#$HOME/}"
  local backup_name="${relative//\//__}"
  mv -- "$target" "$BACKUP_DIR/$backup_name"
  backup_created=1
  printf 'backup    %s -> %s\n' "$target" "$BACKUP_DIR/$backup_name"
}

link_path() {
  local source_rel="$1"
  local target_rel="$2"
  local source="$SCRIPT_DIR/$source_rel"
  local target="$HOME/$target_rel"

  if [[ ! -e "$source" ]]; then
    printf 'missing   %s\n' "$source" >&2
    return 1
  fi

  mkdir -p "$(dirname -- "$target")"

  if [[ -L "$target" ]]; then
    local current_target=""
    current_target="$(readlink -f -- "$target" || true)"
    if [[ "$current_target" == "$(readlink -f -- "$source")" ]]; then
      printf 'ok        %s\n' "$target"
      return 0
    fi
  fi

  if [[ -e "$target" || -L "$target" ]]; then
    backup_target "$target"
  fi

  ln -s -- "$source" "$target"
  printf 'linked    %s -> %s\n' "$target" "$source"
}

ensure_dotfiles_link() {
  local source="$SCRIPT_DIR"
  local target="$HOME/dotfiles"

  if [[ "$(readlink -f -- "$source")" == "$(readlink -f -- "$target" 2>/dev/null || true)" ]]; then
    printf 'ok        %s\n' "$target"
    return 0
  fi

  if [[ -e "$target" || -L "$target" ]]; then
    backup_target "$target"
  fi

  ln -s -- "$source" "$target"
  printf 'linked    %s -> %s\n' "$target" "$source"
}

for link in "${LINKS[@]}"; do
  IFS=: read -r source_rel target_rel <<< "$link"
  link_path "$source_rel" "$target_rel"
done

ensure_dotfiles_link

if ((backup_created == 0)); then
  rmdir --ignore-fail-on-non-empty "$BACKUP_DIR" "$BACKUP_ROOT" 2>/dev/null || true
else
  printf 'backup dir: %s\n' "$BACKUP_DIR"
fi
