#!/usr/bin/zsh

FILENAME="screenshot-`date +%F-%T`"
notify-send -t 2000 "$(grimblast copy screen ~/Screenshots/$FILENAME.png)"
