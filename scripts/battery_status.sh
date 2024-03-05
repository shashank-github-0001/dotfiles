#!/usr/bin/zsh
 

a=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to full|percentage")
notify-send $a
