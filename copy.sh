#!/usr/bin/sh

cp -r -f ./.config ~
cp -r -f .tmux.conf ~
mkdir -p ~/utils
cp -r -f ./utils/. ~/utils/
chmod +x ~/utils/*.sh
