#!/usr/bin/env bash

dbus-update-activation-environment --all &

systemctl --user start hyprpolkitagent &

# clipboard
wl-paste --type text --watch cliphist store & # text data
wl-paste --type image --watch cliphist store & # image data

# wallpaper
waypaper --restore &

# Notification daemon
swaync &

# idling
hypridle &

quickshell

