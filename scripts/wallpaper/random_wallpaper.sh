#!/bin/sh

# Terminate already running feh instances
killall -q feh

# random refresh wallpaper
while true; do
  find ~/wallpaper -type f \( -name '*.jpg' -o -name '*.jpeg' -o -name '*.png' \) -print0 |
    shuf -n1 -z | xargs -0 feh --bg-scale
  sleep 30m
done
