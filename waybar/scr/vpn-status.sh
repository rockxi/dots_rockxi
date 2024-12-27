#!/bin/bash

# Проверка статуса VPN
STATUS=$(sudo vpn status)

if [[ $STATUS == *"Connected"* ]]; then
    echo '{"text": "+", "class": "connected"}'
else
    echo '{"text": "-", "class": "disconnected"}'
fi
