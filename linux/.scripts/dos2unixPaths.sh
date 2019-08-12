#!/bin/sh

sed 's|\(\w\):\\|/mnt/\1/|g;s|\\|/|g'
