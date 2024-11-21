#!/bin/bash

# Dynamically find connected monitors
CONNECTED_MONITORS=$(xrandr --query | grep " connected" | awk '{print $1}')

# Count connected monitors
MONITOR_COUNT=$(echo "$CONNECTED_MONITORS" | wc -l)

if [[ "$MONITOR_COUNT" -eq 1 ]]; then
  # Single monitor setup
  MONITOR=$(echo "$CONNECTED_MONITORS" | head -n 1)
  echo "Single monitor detected: $MONITOR"
  echo "The system likely already set the preferred mode."
  echo "If no reconfiguration is needed, no changes will be made."
  # Optionally reset the configuration
  xrandr --output "$MONITOR" --primary --auto

elif [[ "$MONITOR_COUNT" -ge 2 ]]; then
  # Dual (or more) monitor setup
  INTERNAL_MONITOR=$(echo "$CONNECTED_MONITORS" | grep "eDP")
  EXTERNAL_MONITOR=$(echo "$CONNECTED_MONITORS" | grep -v "eDP" | head -n 1) # Use the first external monitor

  if [[ -n "$INTERNAL_MONITOR" && -n "$EXTERNAL_MONITOR" ]]; then
    # Get preferred modes
    INTERNAL_MODE=$(xrandr | grep -A 1 "^$INTERNAL_MONITOR" | tail -n 1 | awk '{print $1}')
    EXTERNAL_MODE=$(xrandr | grep -A 1 "^$EXTERNAL_MONITOR" | tail -n 1 | awk '{print $1}')

    echo "Setting up dual monitors:"
    echo "  - Internal monitor: $INTERNAL_MONITOR with mode $INTERNAL_MODE"
    echo "  - External monitor: $EXTERNAL_MONITOR with mode $EXTERNAL_MODE"

    xrandr --output "$INTERNAL_MONITOR" --primary --mode "$INTERNAL_MODE"
    xrandr --output "$EXTERNAL_MONITOR" --auto --mode "$EXTERNAL_MODE" --scale 1x1 --above "$INTERNAL_MONITOR"
  else
    echo "Error: Could not identify internal or external monitor properly."
    exit 1
  fi

else
  # No monitors detected
  echo "Error: No connected monitors detected."
  exit 1
fi
