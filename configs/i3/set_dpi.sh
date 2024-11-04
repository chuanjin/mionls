#!/bin/bash

# Count the number of connected monitors
monitor_count=$(xrandr --query | grep " connected" | wc -l)

# Set DPI based on the monitor count
if [ "$monitor_count" -eq 1 ]; then
  dpi=96
else
  dpi=132
fi

# Check if the current DPI is different
if grep -q "^Xft.dpi: $dpi$" ~/.Xresources; then
  # DPI is already set correctly; exit without making changes
  exit 0
fi

# Update or add the Xft.dpi line in .Xresources
if grep -q "Xft.dpi" ~/.Xresources; then
  # Replace the existing Xft.dpi line
  sed -i "s/^Xft.dpi:.*/Xft.dpi: $dpi/" ~/.Xresources
else
  # Add the Xft.dpi line if it doesn't exist
  echo "Xft.dpi: $dpi" >>~/.Xresources
fi

# Apply the updated DPI setting
xrdb -merge ~/.Xresources
