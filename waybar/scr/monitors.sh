#!/bin/bash

monitors=$(hyprctl monitors -j)

active_monitors=$(echo "$monitors" | jq '. | length')


# echo $active_monitors

if [[ $active_monitors == '1' ]]; then 
  echo ""
# elif [[ $active_monitors == '2' ]]; then 
#   echo "two"
# elif [[ $active_monitors == '3' ]]; then 
#   echo "tree"
# elif [[ $active_monitors == '4' ]]; then 
#   echo "four"
else 
  echo "["$active_monitors"]"
fi
