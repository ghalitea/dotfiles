#!/usr/bin/env bash

#get spotify status
STATUS=$(playerctl -p spotify status)

# necessary so the screen still gets locked, even if the image can't be found
if [ -f ~/Pictures/backgrounds/MoonSurfaceRC.png ];
then
    LOCK="i3lock -n -tti ~/Pictures/backgrounds/MoonSurfaceRC.png"
else
    # if there's no image available, use a color
    COLOR="#121212"
    COLOR=${COLOR:1}
    LOCK="i3lock -n -c $COLOR"
fi

if [ "$STATUS" = "Playing" ]
then
    playerctl -p spotify pause
fi
pactl set-source-mute alsa_input.pci-0000_00_1f.3.analog-stereo 1
xfconf-query -c xfce4-notifyd -p /do-not-disturb -s true

eval "$LOCK"

xfconf-query -c xfce4-notifyd -p /do-not-disturb -s false
pactl set-source-mute alsa_input.pci-0000_00_1f.3.analog-stereo 0
if [ "$STATUS" = "Playing" ]
then
    playerctl -p spotify play
fi
