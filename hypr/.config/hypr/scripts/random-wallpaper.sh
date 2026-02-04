#!/bin/bash

# Directory containing wallpapers
WALLPAPER_DIR="/home/bosse/Pictures/Wallpapers/Catppuccin/"

# Check if the wallpaper directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Error: Wallpaper directory '$WALLPAPER_DIR' does not exist."
    exit 1
fi

# Check if swww is installed and available
if ! command -v swww &>/dev/null; then
    echo "Error: swww is not installed or not in PATH."
    exit 1
fi

# Find all image files in the directory (common image formats)
mapfile -t wallpapers < <(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.bmp" -o -iname "*.gif" -o -iname "*.webp" \) 2>/dev/null)

# Check if any wallpapers were found
if [ ${#wallpapers[@]} -eq 0 ]; then
    echo "Error: No image files found in '$WALLPAPER_DIR'."
    echo "Supported formats: jpg, jpeg, png, bmp, gif, webp"
    exit 1
fi

# Pick a random wallpaper
random_wallpaper="${wallpapers[RANDOM % ${#wallpapers[@]}]}"

# Set the wallpaper using swww
echo "Setting wallpaper: $(basename "$random_wallpaper")"
swww img "$random_wallpaper" --transition-type wipe --transition-duration 1

# Check if swww command was successful
if [ $? -eq 0 ]; then
    echo "Wallpaper set successfully!"
    notify-send "Wallpaper Changed" "$(basename "$random_wallpaper")" -i "$random_wallpaper"
else
    echo "Error: Failed to set wallpaper with swww."
    exit 1
fi
