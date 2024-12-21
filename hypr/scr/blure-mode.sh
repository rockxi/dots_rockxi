#!/bin/bash

# Путь к файлу конфигурации
CONFIG_FILE="$HOME/.config/hypr/conf/decoration.conf"

# Строка, которую нужно переключать
TARGET_LINE="layerrule = blur,waybar"

# Проверяем, раскомментирована ли строка
if grep -q "^\s*${TARGET_LINE}$" "$CONFIG_FILE"; then

    # Если раскомментирована, комментируем её
    sed -i "s|^\(\s*\)${TARGET_LINE}$|\1#${TARGET_LINE}|" "$CONFIG_FILE"
    echo "Blur для waybar отключен."

    # Перезапуск Waybar для применения изменений
    killall -9 waybar
    sleep 1
    waybar &
elif grep -q "^\s*#\s*${TARGET_LINE}$" "$CONFIG_FILE"; then
x
    # Если закомментирована, раскомментируем её
    sed -i "s|^\(\s*\)#\s*${TARGET_LINE}$|\1${TARGET_LINE}|" "$CONFIG_FILE"
    echo "Blur для waybar включен."

    # Перезапуск Waybar для применения изменений
    killall -9 waybar
    sleep 1
    waybar &
else

    # Если строки нет, добавляем её
    echo "$TARGET_LINE" >> "$CONFIG_FILE"
    echo "Строка добавлена. Blur для waybar включен."
fi
