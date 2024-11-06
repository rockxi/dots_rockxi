#!/bin/bash

# Путь к файлу style.css
CSS_FILE="/home/r/.config/waybar/style.css"

# Определение цветов
WHITE="#ffffff"
BLACK="#000000"

# Проверка существования файла
if [[ ! -f "$CSS_FILE" ]]; then
    echo "Файл $CSS_FILE не найден!"
    exit 1
fi

# Извлечение текущего цвета
CURRENT_COLOR=$(grep "@define-color float_font_color" "$CSS_FILE" | awk '{print $3}' | tr -d ';')

# Проверка текущего цвета и установка нового
if [[ "$CURRENT_COLOR" == "$WHITE" ]]; then
    NEW_COLOR="$BLACK"
else
    NEW_COLOR="$WHITE"
fi

# Замена цвета в файле
sed -i "s/@define-color float_font_color $CURRENT_COLOR;/@define-color float_font_color $NEW_COLOR;/" "$CSS_FILE"

# Перезапуск Waybar для применения изменений
killall -9 waybar
sleep 1
waybar &

# Уведомление пользователя
echo "float_font_color изменён на $NEW_COLOR"