#!/usr/bin/env bash
# Screenshot an area, keeping tooltips/menus that slurp would dismiss.
# Captures the full screen first, then crops to a selected region.
set -euo pipefail

TMP=$(mktemp --suffix=.png)
trap 'rm -f "$TMP"' EXIT

# Freeze the screen (tooltip still visible) before slurp grabs the pointer.
grim "$TMP"

GEO=$(slurp -f "%wx%h+%x+%y") || { echo "Cancelled."; exit 1; }

magick "$TMP" -crop "$GEO" +repage - | wl-copy
