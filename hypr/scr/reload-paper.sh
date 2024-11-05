#!/bin/bash

# Параметры
WALLPAPER_DIR="$HOME/.wallpapers/"
CONFIG_PATH="$HOME/.config/hypr/hyprpaper.conf"
HISTORY_FILE="$HOME/.config/hypr/wallpaper_history.txt"

# Функция для установки обоев
set_wallpaper() {
    local wallpaper="$1"
    if [ -n "$wallpaper" ]; then
        # Обновляем конфигурацию Hyprpaper
        sed -i "s|^preload = .*|preload = ${wallpaper}|" "$CONFIG_PATH"
        sed -i "s|^wallpaper = .*|wallpaper = , ${wallpaper}|" "$CONFIG_PATH"
        
        # Записываем в историю
        echo "$wallpaper" >> "$HISTORY_FILE"
        
        # Перезапускаем hyprpaper для применения изменений
        killall hyprpaper
        sleep 1
        hyprpaper &
    fi
}

# Проверяем аргументы
case "$1" in
    1)
        # Выбираем случайные обои
        RANDOM_WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
        if [ -n "$RANDOM_WALLPAPER" ]; then
            set_wallpaper "$RANDOM_WALLPAPER"
        else
            echo "Не найдено обоев в директории $WALLPAPER_DIR"
            exit 1
        fi
        ;;
    2)
        # Возвращаемся к предыдущим обоям
        if [ -f "$HISTORY_FILE" ]; then
            # Получаем предпоследнюю строку из истории
            PREV_WALLPAPER=$(tail -n 2 "$HISTORY_FILE" | head -n 1)
            
            if [ -n "$PREV_WALLPAPER" ]; then
                # Удаляем последнюю запись из истории
                sed -i '$d' "$HISTORY_FILE"
                set_wallpaper "$PREV_WALLPAPER"
            else
                echo "Нет предыдущих обоев для возврата."
                exit 1
            fi
        else
            echo "Файл истории не найден."
            exit 1
        fi
        ;;
    *)
        # Без аргументов: открываем диалог выбора обоев
        NEW_WALLPAPER=$(zenity --file-selection --filename="$WALLPAPER_DIR" --title="Выберите обои")
        
        if [ -n "$NEW_WALLPAPER" ]; then
            set_wallpaper "$NEW_WALLPAPER"
        else
            echo "Обои не выбраны."
            exit 1
        fi
        ;;
esac