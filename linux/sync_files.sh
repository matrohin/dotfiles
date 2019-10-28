#!/usr/bin/sh
rsync \
  --exclude "sync_files.sh" \
  --exclude "install.sh" \
  -avh --no-perms . ~

