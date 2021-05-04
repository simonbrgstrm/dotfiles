#!/usr/bin/env zsh

TRAPUSR1() {
  if [[ -o INTERACTIVE ]]; then
     exec "${SHELL}"
  fi
}
