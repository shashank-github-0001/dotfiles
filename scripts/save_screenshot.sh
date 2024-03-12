#!/usr/bin/zsh

FILENAME="screenshot-`date +%F-%T`"
notify-send -t 1000 "screenshot saved to: $(grimshot save active ~/Screenshots/"$FILENAME".png)"

