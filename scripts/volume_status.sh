#!/usr/bin/zsh
 
a=$(pamixer --get-volume)
notify-send -t 1000 $a
