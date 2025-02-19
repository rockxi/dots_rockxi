#!/bin/bash

CONFIG_FILE="$HOME/.config/hypr/conf/input.conf"
OPTION1="kb_options = grp:alt_shift_toggle, caps:swapescape"
OPTION2="kb_options = grp:alt_shift_toggle"

# Проверяем существование файла
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Файл конфигурации не найден: $CONFIG_FILE"
    exit 1
fi

# Читаем текущее содержимое файла
current_setting=$(grep "^[[:space:]]*kb_options" "$CONFIG_FILE")

# Удаляем начальные и конечные пробелы
current_setting=$(echo "$current_setting" | xargs)

# Выполняем переключение
if [ "$current_setting" = "$OPTION1" ]; then
    # Заменяем на вариант без caps:swapescape
    sed -i "s|$OPTION1|$OPTION2|" "$CONFIG_FILE"
    echo "Переключено на: $OPTION2"
elif [ "$current_setting" = "$OPTION2" ]; then
    # Заменяем на вариант с caps:swapescape
    sed -i "s|$OPTION2|$OPTION1|" "$CONFIG_FILE"
    echo "Переключено на: $OPTION1"
else
    echo "Не найдена ожидаемая настройка kb_options"
    exit 1
fi 