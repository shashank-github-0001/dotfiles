#!/usr/bin/bash

wal -R
killall waybar
killall swaync
sleep 0.5
waybar &
swaync &
