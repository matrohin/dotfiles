#!/usr/bin/env bash
DIR=~/Pictures/wallpapers
WALL=$(find "$DIR" -type f | shuf -n 1)
swaymsg output '*' bg "$WALL" fill
echo "$WALL" > ~/.cache/wallpaper
