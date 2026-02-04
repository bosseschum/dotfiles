#!/usr/bin/env bash

# Wofi Power Menu

# Entries for wofi
entries="⏻ Shutdown\n⏼ Reboot\n⏾ Suspend\n⎋ Logout\n Lock"

# Run wofi
selected=$(echo -e $entries | wofi --dmenu -n \
    --style ~/.config/wofi/powermenu.css \
    --hide-search true \
    --width 335 \
    --height 385| awk '{print tolower($2)}')

# Execute the selected command
case $selected in
  shutdown)
    systemctl poweroff;;
  reboot)
    systemctl reboot;;
  suspend)
    systemctl suspend;;
  logout)
    hyprctl dispatch exit;;
  lock)
    hyprlock;;
esac
