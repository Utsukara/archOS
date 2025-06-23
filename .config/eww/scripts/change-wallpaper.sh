#!/bin/bash

# Get the wallpaper filename passed as an argument
SELECTED_WALLPAPER=$1
WALLPAPER_DIR="$HOME/wallpapers"

# Ensure the wallpaper file exists
if [ -f "$WALLPAPER_DIR/$SELECTED_WALLPAPER.jpg" ]; then
    # Resolve symlinks to get the actual target config files
    SYMLINK_CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"
    SYMLINK_LOCK_CONFIG="$HOME/.config/hypr/hyprlock.conf"
    TARGET_FILE=$(readlink -f "$SYMLINK_CONFIG_FILE")
    TARGET_FILE2=$(readlink -f "$SYMLINK_LOCK_CONFIG")

    # Set the new wallpaper path in both config files
    sed -i -e "s|^preload = .*|preload = $HOME/wallpapers/$SELECTED_WALLPAPER.jpg|" \
           -e "s|^wallpaper = ,.*|wallpaper = ,$HOME/wallpapers/$SELECTED_WALLPAPER.jpg|" "$TARGET_FILE"

    sed -i -e "s|^path = .*|path = $HOME/wallpapers/$SELECTED_WALLPAPER.jpg|" "$TARGET_FILE2"

    # Call the script to reload pywal, eww, and hyprpaper
    "/home/shinra/.config/eww/scripts/update-color.sh" "$SELECTED_WALLPAPER"
else
    echo "Wallpaper not found: $SELECTED_WALLPAPER"
    exit 1
fi

