#!/usr/bin/bash

wallpaper=$1
wal -i "$wallpaper" 
killall swaybg
killall waybar
killall swaync
swaybg -i "$wallpaper" -m fill &
waybar &
swaync &
