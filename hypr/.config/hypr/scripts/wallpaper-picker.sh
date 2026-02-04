#!/bin/bash

# Wofi Wallpaper Picker with Image Previews
# Dependencies: wofi, swww, imagemagick (for convert), dunst (for notifications), kitty (for image preview)

# Configuration
WALLPAPER_DIR="$HOME/Pictures/Wallpapers/Catppuccin/"
CACHE_DIR="$HOME/.cache/wofi-wallpaper-picker"
PREVIEW_SIZE="400x400"

# Create cache directory if it doesn't exist
mkdir -p "$CACHE_DIR/previews"

# Function to generate preview image
generate_preview() {
    local img="$1"
    local preview="$CACHE_DIR/previews/$(basename "$img").png"

    if [ ! -f "$preview" ]; then
        convert "$img" -resize "$PREVIEW_SIZE" "$preview" 2>/dev/null
    fi
    echo "$preview"
}

# Function to set wallpaper using swww
set_wallpaper() {
    local wallpaper="$1"

    # Set wallpaper with swww
    swww img "$wallpaper" --transition-type wipe --transition-duration 1

    # Save the current wallpaper choice
    echo "$wallpaper" >"$CACHE_DIR/current_wallpaper"
}

# Check if wallpaper directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    notify-send "Error" "Wallpaper directory not found: $WALLPAPER_DIR"
    exit 1
fi

# Generate list of wallpapers
declare -A wallpaper_map
wallpaper_list=""

while IFS= read -r img; do
    [ -f "$img" ] || continue

    filename=$(basename "$img")
    # Generate preview (cached)
    generate_preview "$img" >/dev/null

    wallpaper_list+="${filename}\n"
    wallpaper_map["$filename"]="$img"
done < <(find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) 2>/dev/null | sort)

# Remove trailing newline
wallpaper_list=$(echo -e "$wallpaper_list" | sed '/^$/d')

# Show wofi
selected=$(echo -e "$wallpaper_list" | wofi \
    --dmenu -n \
    --insensitive \
    --prompt "Select Wallpaper" \
    --width 335 \
    --height 450 \
    --cache-file=/dev/null \
    --matching=fuzzy)

# Set the selected wallpaper
if [ -n "$selected" ]; then
    wallpaper_path="${wallpaper_map[$selected]}"

    if [ -n "$wallpaper_path" ] && [ -f "$wallpaper_path" ]; then
        set_wallpaper "$wallpaper_path"
        notify-send "Wallpaper Changed" "$selected" -i "$wallpaper_path"
    fi
fi
