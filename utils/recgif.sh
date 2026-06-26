#!/usr/bin/env bash
# Record a screen region and convert it to a gif.
# Usage: recgif.sh [output.gif]   (default: ~/recgif-<timestamp>.gif)
set -euo pipefail

FPS=15
WIDTH=800
OUT="${1:-$HOME/recgif-$(date +%Y%m%d-%H%M%S).gif}"
MP4="${OUT%.gif}.mp4"
FRAMES=$(mktemp -d)
trap 'rm -rf "$FRAMES"' EXIT

REGION=$(slurp) || { echo "Cancelled."; exit 1; }

echo "Recording $REGION — press Ctrl+C to stop."
notify-send -t 2000 "recgif" "Recording — Ctrl+C to stop" 2>/dev/null || true
# wf-recorder exits non-zero on the Ctrl+C that stops it; that's expected.
wf-recorder -g "$REGION" -f "$MP4" || true

echo "Converting to $OUT ..."
ffmpeg -loglevel error -i "$MP4" \
    -vf "fps=$FPS,scale=$WIDTH:-1:flags=lanczos" "$FRAMES/f%04d.png"
gifski -o "$OUT" --fps "$FPS" "$FRAMES"/f*.png

echo "Saved $OUT and $MP4"
notify-send -t 3000 "recgif" "Saved $OUT and $MP4" 2>/dev/null || true
