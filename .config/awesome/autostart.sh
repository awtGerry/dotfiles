#!/bin/sh

# Set the wallpaper
~/.local/bin/awt --walls &
~/.local/bin/awt --keys rate &

autostart="xcompmgr dunst pipewire"
for app in $autostart; do
    pidof -sx "$app" || "$app" &
done >/dev/null 2>&1
