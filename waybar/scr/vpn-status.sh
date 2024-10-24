#!/bin/bash

# Проверка статуса VPN
STATUS=$(sudo vpn status)

if [[ $STATUS == *"Connected"* ]]; then
    echo '{"text": "VPN: ON", "class": "connected"}'
else
    echo '{"text": "VPN: OFF", "class": "disconnected"}'
fi
