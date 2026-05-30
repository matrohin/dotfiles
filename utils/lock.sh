#!/usr/bin/env bash
WALL=$(cat ~/.cache/wallpaper 2>/dev/null)
if [ -n "$WALL" ] && [ -f "$WALL" ]; then
    exec swaylock -f -i "$WALL"
else
    exec swaylock -f
fi
