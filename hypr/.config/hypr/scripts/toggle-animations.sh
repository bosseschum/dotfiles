#!/bin/bash

CONFIG="$HOME/.config/hypr/animations.conf"

# 1. Search for the line specifically inside the 'animations {' block
# This looks for 'enabled =' followed by 'true' or 'yes'
if grep -Eiq '^\s*enabled\s*=\s*(true|yes)' "$CONFIG"; then
    # Change to false
    sed -i -E 's/^(\s*enabled\s*=\s*)(true|yes)/\1false/' "$CONFIG"
    notify-send "Hyprland" "Animations Disabled"
else
    # Change to true
    sed -i -E 's/^(\s*enabled\s*=\s*)(false|no)/\1true/' "$CONFIG"
    notify-send "Hyprland" "Animations Enabled"
fi
