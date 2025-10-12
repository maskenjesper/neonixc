#!/usr/bin/env bash

running=$(ps -e | grep waybar)

if [[ -n $running ]] then
   killall .waybar-wrapped 
else
   waybar
fi
