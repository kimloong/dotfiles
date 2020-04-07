#!/usr/bin/env bash

# Terminate already running bar instances
# killall -q i3

mkdir -p ~/.local/share/i3/log

/usr/bin/i3 -V >> ~/.local/share/i3/log/i3.log 2>&1