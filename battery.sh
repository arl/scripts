#!/bin/sh
# Prints current battery percentage and an unicode symbol indicating
# whether it's over 20% (🔋 or 🪫).
# Can be used for a tmux status bar for example.

VAL=$(cat /sys/class/power_supply/BAT0/capacity)
LOW='🪫'
HIGH='🔋'

BATTERY=$HIGH
[ $VAL -lt 20 ] && BATTERY=$LOW

printf "%s%d%%" $BATTERY $VAL
