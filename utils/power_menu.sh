#!/usr/bin/env bash

# Options
options="Shutdown\nRestart\nSuspend\nLogout"

# Launch fuzzel in dmenu mode
choice=$(echo -e $options | fuzzel --dmenu --prompt "Power: ")

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
