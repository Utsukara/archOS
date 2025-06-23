#!/bin/bash

# Path to the resolved hyprpaper config
CONFIG_FILE="$HOME/.config/hypr/hyprpaper.conf"

# Find the wallpaper line and extract the numeric ID from the filename
wallpaper=$(awk -F'/' '/^wallpaper =/ {print $NF}' "$CONFIG_FILE" | grep -oP '\d+' | head -n 1)

# Output the wallpaper number
echo "$wallpaper"

