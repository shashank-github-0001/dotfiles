#!/usr/bin/zsh

killall waybar
sleep 0.5
waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css
