#!/bin/bash
xmodmap -e "pointer = 1 8 3 4 5 6 7 2 9 10 11 12 13"
xinput set-int-prop "Logitech USB Trackball" "Evdev Wheel Emulation" 8 1
xinput set-int-prop "Logitech USB Trackball" "Evdev Wheel Emulation Button" 8 9
xinput set-prop "Logitech USB Trackball" "Evdev Wheel Emulation Axes" 6 7 4 5
