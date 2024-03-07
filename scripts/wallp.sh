#!/usr/bin/zsh

wallpaper=$1
swaybg -i "$wallpaper" -m fill &
wal -i "$wallpaper" 
killall waybar
sleep 0.5
waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css &
