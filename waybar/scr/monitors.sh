#!/bin/bash

monitors=$(hyprctl monitors -j)

active_monitors=$(echo "$monitors" | jq '. | length')


if [[ $active_monitors == '1' ]]; then 
  echo "one"
elif [[ $active_monitors == '2' ]]; then 
  echo "two"
elif [[ $active_monitors == '3' ]]; then 
  echo "tree"
elif [[ $active_monitors == '4' ]]; then 
  echo "four"
else 
  echo "five"
fi
