#!/bin/bash

# Массив названий папок
folders=("alacritty" "hypr" "waybar" "kitty" "ml4w" "ml4w-hyprland-settings")
# Текущая директория
current_dir=$(pwd)

# Директория .config
config_dir="$HOME/.config"

# Проходим по каждому элементу массива
for folder in "${folders[@]}"; do
  # Удаляем папку из текущей директории, если она существует
  if [ -d "$current_dir/$folder" ]; then
    rm -rf "$current_dir/$folder"
    echo "Удалено: $folder"
  fi

  # Проверяем, существует ли папка в .config
  if [ -d "$config_dir/$folder" ]; then
    # Копируем папку в текущую директорию
    cp -r "$config_dir/$folder" "$current_dir"
    echo "Скопировано: $folder"
  else
    echo "Папка $folder не найдена в $config_dir"
  fi
done

