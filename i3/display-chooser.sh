#!/bin/sh

xrandr --output VGA-0 --off --output DVI-0 --off --output LVDS --auto

i3-nagbar -m "Display Chooser" -t warning \
	-b "Laptop HIGH-RES" "xrandr -s 2880x1800" \
	-b "Laptop LOW-RES" "xrandr -s 1920x1200" \
	-b "Laptop Only" "xrandr --output DP-1 --off --output eDP-1 --auto" \
	-b "Laptop + HDMI" "xrandr --output eDP-2 --auto --output DP-1 --auto --right-of eDP-2" \
	-b "HDMI ONLY" "xrandr --output eDP-1 --off --output DP-1 --auto" \
	-b "1080p HDMI ONLY" "xrandr --output eDP-1 --off --output DP-1 --auto --scale 2x2 --panning 1920x1080" \
	-b "PLUGGABLE" "xrandr --output eDP-1 --off --output DP-1 --auto"

feh --bg-fill ~/.background.png
