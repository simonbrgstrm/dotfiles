#!/usr/bin/env bash

usage="$(basename "$0") [-h] [-b n] -- program to set webcam background. 

where:
    -h  show this help text
    -b  [background] set the background
        Example: ./webcambg.sh -b purp.png"

while getopts ':hb:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
    b) sudo $HOME/dotfiles/scripts/bgrm.sh -b $HOME/Pictures/teamsbg/$OPTARG -w 640 -H 480 -s 2.0
       ;;
    :) printf "missing argument for -%b\n" "$OPTARG" >&2
       echo "Backgrounds:"
       ls $HOME/Pictures/teamsbg/
       exit 1
       ;;
   \?) printf "illegal option: -%b\n" "$OPTARG" >&2
       echo "$usage" >&2
              exit 1
       ;;
  esac
done
shift $((OPTIND - 1))

