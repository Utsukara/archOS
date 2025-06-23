#!/bin/zsh

# Get track length in microseconds from Firefox MPRIS
LENGTH_MICROSECONDS=$(playerctl --player=firefox metadata --format "{{mpris:length}}" 2>/dev/null)

# Exit if unavailable
if [[ -z "$LENGTH_MICROSECONDS" || "$LENGTH_MICROSECONDS" == "0" ]]; then
  exit 1
fi

# Convert percentage input to seconds
REALVALUE=$(python3 -c "
import sys
length_microseconds = float(sys.argv[1])
percentage = float(sys.argv[2])
length_seconds = length_microseconds / 1000000
real_value = (percentage / 100) * length_seconds
print(real_value)
" "$LENGTH_MICROSECONDS" "$1")

# Seek to the calculated position
playerctl --player=firefox position "$REALVALUE"

