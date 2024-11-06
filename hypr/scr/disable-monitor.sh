#!/bin/sh

# Если подключен монитор модели C32JG5x, отключаем монитор eDP-1
if hyprctl monitors -j | grep -q "C32JG5x"; then
    hyprctl keyword monitor eDP-1,disabled
fi
