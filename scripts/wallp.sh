#!/usr/bin/zsh

wallpaper=$1
wal -i "$wallpaper" 
killall waybar
killall swaync
sleep 0.5
swaybg -i "$wallpaper" -m fill &
waybar &
swaync &
