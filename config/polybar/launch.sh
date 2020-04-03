#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a ~/.local/share/polybar/log/polybar1.log ~/.local/share/polybar/log/polybar2.log
polybar bar1 >> ~/.local/share/polybar/log/polybar1.log 2>&1 &
# polybar bar2 >> ~/.local/share/polybar/log/polybar2.log 2>&1 &

echo "Bars launched..."
