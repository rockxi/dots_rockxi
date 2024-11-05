#!/bin/bash

NEW_WALLPAPER=$(zenity --file-selection --filename="/home/r/.wallpapers/" --title="Select Wallpaper")

if [ -n "$NEW_WALLPAPER" ]; then
    CONFIG_PATH="$HOME/.config/hypr/hyprpaper.conf"
    sed -i "s|^preload = .*|preload = ${NEW_WALLPAPER}|" "$CONFIG_PATH"
    sed -i "s|^wallpaper = .*|wallpaper = , ${NEW_WALLPAPER}|" "$CONFIG_PATH"
    killall hyprpaper
    sleep 1
    hyprpaper &
fi

