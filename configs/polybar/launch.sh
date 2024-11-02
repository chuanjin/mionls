#!/usr/bin/env bash

# Terminate already running Polybar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Fetch the primary monitor using xrandr
PRIMARY_MONITOR=$(xrandr --query | grep " primary" | awk '{print $1}')

# Launch Polybar on the primary monitor
if [ -n "$PRIMARY_MONITOR" ]; then
  MONITOR=$PRIMARY_MONITOR polybar --reload topbar &
  echo "Polybar launched on primary monitor: $PRIMARY_MONITOR"
else
  echo "No primary monitor found. Polybar not launched."
fi
