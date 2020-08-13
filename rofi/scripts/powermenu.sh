#!/usr/bin/env bash

rofi_command="rofi -theme themes/sidebar/five.rasi"

# Options
shutdown=""
reboot=""
suspend=""
Exit=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$suspend\n$Exit"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
        shutdown now
        ;;
    $reboot)
        reboot
        ;;
    $suspend)
        mpc -q pause
        systemctl suspend
        ;;
    $Exit)
        pkill -KILL -u $(whoami)
        ;;
esac
