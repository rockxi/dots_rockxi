#!/bin/bash

# Проверка статуса VPN
STATUS=$(sudo vpn status)

if [[ $STATUS == *"Connected"* ]]; then
    echo '{"text": "ON", "class": "connected"}'
else
    echo '{"text": "OFF", "class": "disconnected"}'
fi
