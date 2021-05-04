#!/usr/bin/env zsh

TRAPUSR1() {
  if [[ -o INTERACTIVE ]]; then
     {echo; echo execute a new shell instance } 1>&2
     exec "${SHELL}"
  fi
}
