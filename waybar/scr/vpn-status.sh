#!/bin/bash

# Проверка статуса VPN
STATUS=$(sudo vpn status)

if [[ $STATUS == *"Connected"* ]]; then
    echo '{"text": "on", "class": "connected"}'
else
    echo '{"text": "off", "class": "disconnected"}'
fi
