#!/bin/sh

xrandr --output VGA-0 --off --output DVI-0 --off --output LVDS --auto

i3-nagbar -m "Display Chooser" -t warning \
	-b "Laptop HIGH-RES" "xrandr -s 2880x1800" \
	-b "Laptop LOW-RES" "xrandr -s 1920x1200" \
	-b "Laptop Only" "xrandr --output HDMI-1 --off --output eDP-2 --auto" \
	-b "Laptop + HDMI" "xrandr --output eDP-2 --auto --output HDMI-1 --auto --right-of eDP-2" \
	-b "HDMI ONLY" "xrandr --output eDP-2 --off --output HDMI-1 --auto"

feh --bg-fill ~/.background.png
