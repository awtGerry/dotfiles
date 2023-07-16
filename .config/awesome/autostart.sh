#!/bin/sh

# Set the wallpaper
~/.local/bin/awt --walls &
~/.local/bin/awt --keys rate &

# xrandr --output DP-1 --mode 1920x1080 --rate 144 &
xrandr --output HDMI-0 --off

autostart="xcompmgr dunst pipewire"
for app in $autostart; do
    pidof -sx "$app" || "$app" &
done >/dev/null 2>&1
