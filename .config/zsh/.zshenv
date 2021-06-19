#!/usr/bin/env zsh

dot=$HOME/dotfiles

TRAPUSR1() {
  if [[ -o INTERACTIVE ]]; then
     exec "${SHELL}"
  fi
}
