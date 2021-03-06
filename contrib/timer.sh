#!/bin/sh

alarm_noise="$HOME"/.config/timer/alarm.wav
timer "$@" || exit

isMuted=$(pamixer --get-mute)
pamixer -u
notify-send -u critical "alarm finished"
ffplay -hide_banner -loglevel error -nodisp -autoexit "$alarm_noise" > /dev/null

if [ "$isMuted" = true ]; then
  pamixer -m
fi
