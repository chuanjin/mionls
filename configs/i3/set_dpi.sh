#!/bin/bash

# Define the path for the flag file
FLAG_FILE="/tmp/dpi_update_flag"

# Exit if the flag file exists (to prevent a loop)
if [ -f "$FLAG_FILE" ]; then
  # Remove the flag file and exit to avoid repeated runs
  rm "$FLAG_FILE"
  exit 0
fi

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

# Create the flag file
touch "$FLAG_FILE"

# Restart i3 to refresh the bar and other UI elements
i3-msg restart
