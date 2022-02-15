#!/bin/bash

level=$(cat /sys/class/power_supply/BAT0/capacity)
state=$(cat /sys/class/power_supply/BAT0/status)

low_threshold=10

if [ "$level" -lt $low_threshold ] && [[ $state = *Discharging* ]]; then
        dunstify -u normal -a "Battery Level" "bat" "The battery level is below 10 percent. Will sleep soon."
fi

