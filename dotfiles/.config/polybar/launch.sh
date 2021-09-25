#!/bin/sh

# Terminate already running bar instances
killall -q polybar

if type "xrandr"; then
  for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload i3 &
  done
else
  polybar --reload i3 &
fi
