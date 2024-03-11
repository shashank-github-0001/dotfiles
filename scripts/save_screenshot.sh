#!/usr/bin/zsh

FILENAME="screenshot-`date +%F-%T`"
notify-send -t 2000 "$(grimblast save screen ~/Screenshots/$FILENAME.png)"
