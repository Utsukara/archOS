#!/bin/bash

# Get current playback position and total length from Firefox (MPRIS)
POSITION=$(playerctl --player=firefox position 2>/dev/null)
LENGTH_MICROSECONDS=$(playerctl --player=firefox metadata --format "{{mpris:length}}" 2>/dev/null)

# Exit early if no values
if [[ -z "$POSITION" || -z "$LENGTH_MICROSECONDS" || "$LENGTH_MICROSECONDS" == "0" ]]; then
  echo "0"
  exit 0
fi

# Calculate percentage (safe float division)
PERCENTAGE=$(python3 -c "
import sys
position = float(sys.argv[1])
length_seconds = float(sys.argv[2]) / 1000000
percentage = (position / length_seconds) * 100
print(f'{percentage:.2f}')
" "$POSITION" "$LENGTH_MICROSECONDS")

echo "$PERCENTAGE"

