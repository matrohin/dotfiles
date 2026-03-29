#!/usr/bin/env bash

# Options
options="Shutdown\nRestart\nSuspend\nLogout"

# Launch rofi in dmenu mode
choice=$(echo -e $options | rofi -dmenu -p "Power")

# Perform action based on choice
case "$choice" in
    Shutdown)
        systemctl poweroff
        ;;
    Restart)
        systemctl reboot
        ;;
    Suspend)
        systemctl suspend
        ;;
    Logout)
        loginctl terminate-user $USER
        ;;
esac
