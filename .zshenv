#!/usr/bin/env zsh

# Skip Debian/Ubuntu's system-wide compinit in /etc/zsh/zshrc; zim's
# completion module already handles compinit and would otherwise run it twice.
skip_global_compinit=1

TRAPUSR1() {
  if [[ -o INTERACTIVE ]]; then
     exec "${SHELL}"
  fi
}
