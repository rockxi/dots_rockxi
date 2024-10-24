#!/bin/zsh
connected=$(sudo vpn status)

if [[ $connected == *"Disconnected"* ]]; then
    sudo vpn connect
    notify-send "VPN connected"
else
    sudo vpn disconnect
    notify-send "VPN disconnected"
fi
