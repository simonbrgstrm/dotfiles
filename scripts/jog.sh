#!/usr/bin/env bash

grep -v "jog" ~/.zsh_history_ext | grep -a --color=never "${PWD}   " | cut -f1 -d"|" | tail
