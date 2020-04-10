#!/bin/sh

# Terminate already running feh instances
killall -q feh

from=$(find ~/wallpaper -type f \( -name '*.jpg' -o -name '*.jpeg' \) -print0 |shuf -n1 -z)
convert ${from} ~/wallpaper/lock.png

# random refresh wallpaper
while true; do
  find ~/wallpaper -type f \( -name '*.jpg' -o -name '*.jpeg' \) -print0 |
    shuf -n1 -z | xargs -0 feh --bg-scale
  sleep 30m
done
