#!/bin/bash

# Get CPU temp from AMD sensor (Tctl)
cpu_temp=$(sensors | awk '/Tctl:/ {gsub(/\+|°C/,"",$2); print $2}' | cut -d'.' -f1)

# Print as integer
echo "$cpu_temp"

