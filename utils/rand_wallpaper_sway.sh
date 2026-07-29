#!/usr/bin/env bash
DIR=~/Pictures/wallpapers
WALL=$(find "$DIR" -type f | shuf -n 1)
# Bail out rather than clear the bg and the cached path lock.sh reads
[ -n "$WALL" ] || exit 0
swaymsg output '*' bg "$WALL" fill
echo "$WALL" > ~/.cache/wallpaper
