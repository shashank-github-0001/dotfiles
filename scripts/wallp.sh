#!/usr/bin/zsh

wallpaper=$1
wal -i "$wallpaper" 
killall waybar
swaybg -i "$wallpaper" -m fill &
sleep 0.5
waybar &
