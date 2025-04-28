#!/bin/bash

# Имя вашего монитора
MONITOR="eDP-1"

# Желаемое разрешение и позиция при включении монитора
RESOLUTION="1920x1200"
POSITION="0x1080"
REFRESH_RATE="1"  # Частота обновления (может быть 1 или другое значение, в зависимости от конфигурации)

# Функция для проверки текущего состояния монитора
is_enabled() {
    hyprctl monitors | grep -q "$MONITOR" 
    # Предполагается, что статус монитора содержит слово "active" когда включен
}

# Переключение состояния монитора
if is_enabled; then
    echo "Выключение монитора $MONITOR..."
    hyprctl keyword monitor "$MONITOR,disabled"
    if [ $? -eq 0 ]; then
        echo "Монитор $MONITOR успешно выключен."
    else
        echo "Ошибка при попытке выключить монитор $MONITOR."
    fi
else
    echo "Включение монитора $MONITOR с разрешением $RESOLUTION..."
    hyprctl keyword monitor "$MONITOR,$RESOLUTION,$POSITION,$REFRESH_RATE"
    if [ $? -eq 0 ]; then
        echo "Монитор $MONITOR успешно включен."
    else
        echo "Ошибка при попытке включить монитор $MONITOR."
    fi
fi
