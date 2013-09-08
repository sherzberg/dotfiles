#!/bin/sh

xrandr --output VGA-0 --off --output DVI-0 --off --output LVDS --auto

i3-nagbar -m "Display Chooser" -t warning \
	-b "Laptop Only"  "xrandr --output DP-2 --off --output LVDS-2 --auto" \
	-b "Laptop + DP"  "xrandr --output LVDS-2 --auto --output DP-2 --auto --right-of LVDS-2" \
	-b "DP ONLY"    "xrandr --output LVDS-2 --off --output DP-2 --auto"

