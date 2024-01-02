#!/bin/sh
# Prints current battery percentage and an unicode symbol indicating
# whether it's over 20% (🔋 or 🪫).
# If the battery is not currently discharging (i.e. it's plugged) a
# 🔌 is shown.
# Can be used for a tmux status bar for example.

percent=$(cat /sys/class/power_supply/BAT0/capacity)
low='🪫'
high='🔋'
plugged='🔌'

battery=$high
[ $percent -le 20 ] && battery=$low

status=$(grep POWER_SUPPLY_STATUS /sys/class/power_supply/BAT0/uevent | cut -d'=' -f2)
[ "$status" = "Discharging" ] && plugged=''

printf "%s%s%s%%" $plugged $battery $percent
