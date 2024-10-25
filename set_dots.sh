#!/bin/bash

# Массив названий папок
folders=("alacritty" "hypr" "waybar" "kitty" "ml4w" "ml4w-hyprland-settings" "rofi")

# Текущая директория
current_dir=$(pwd)

# Директория .config
config_dir="$HOME/.config"

# Проходим по каждому элементу массива
for folder in "${folders[@]}"; do
  # Удаляем папку из .config, если она существует
  if [ -d "$config_dir/$folder" ]; then
    rm -rf "$config_dir/$folder"
    echo "Удалено из .config: $folder"
  fi

  # Проверяем, существует ли папка в текущей директории
  if [ -d "$current_dir/$folder" ]; then
    # Копируем папку в .config
    cp -r "$current_dir/$folder" "$config_dir"
    echo "Скопировано в .config: $folder"
  else
    echo "Папка $folder не найдена в текущей директории"
  fi
done

# Копируем .zshrc из текущей директории в домашнюю директорию
if [ -f "$current_dir/.zshrc" ]; then
  cp "$current_dir/.zshrc" "$HOME"
  echo "Скопировано: .zshrc"
else
  echo "Файл .zshrc не найден в текущей директории"
fi

