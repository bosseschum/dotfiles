#!/bin/bash

# Path to your Hyprland keymaps config file
KEYMAP_FILE="$HOME/.config/hypr/keymaps.conf"

# Check if the file exists
if [ ! -f "$KEYMAP_FILE" ]; then
    notify-send "Error" "Keymaps file not found at $KEYMAP_FILE"
    exit 1
fi

# Extract keybinds from the config file and format them nicely
keybinds=$(awk '
    # Capture comments that might be aliases (only if line has # as first non-whitespace char)
    /^[[:space:]]*#/ {
        # Store the whole comment line
        comment_line = $0
        # Remove leading whitespace and #
        gsub(/^[[:space:]]*#[[:space:]]*/, "", comment_line)
        # Store it as potential alias
        next_alias = comment_line
        next
    }
    
    # Process bind lines
    /^[[:space:]]*(bind|bindm)[[:space:]]*=/ {
        # Remove bind/bindm and equals
        line = $0
        gsub(/^[[:space:]]*bind[m]*[[:space:]]*=[[:space:]]*/, "", line)
        
        # Split by comma
        n = split(line, parts, ",")
        
        mods = parts[1]
        key = parts[2]
        
        # Remove leading/trailing spaces
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", mods)
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", key)
        
        keybind = mods " + " key
        
        # Only show keybinds that have an alias
        if (next_alias != "") {
            printf "%-20s → %s\n", next_alias, keybind
        }
        
        # Reset alias after processing each bind
        next_alias = ""
    }
    
    # Reset alias if we hit a non-comment, non-bind line
    /^[[:space:]]*[^#]/ && !/bind/ {
        next_alias = ""
    }
' "$KEYMAP_FILE")

# Display in wofi
echo "$keybinds" | wofi --dmenu -n \
    --prompt "Hyprland Keybinds" \
    --width 23% \
    --height 26% \
    --style "$HOME/.config/wofi/style.css" \
    --insensitive
