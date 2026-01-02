#!/bin/bash

# A simple script to get the active window class and title for Waybar.
# This version uses a loop that prints only the new window info.

#hyprctl sub onwindowfocused "" | while read -r _; do
#    # Use hyprctl to get the class and title of the currently focused window
#    window_class=$(hyprctl -j activewindow | jq -r '.class')
#    window_title=$(hyprctl -j activewindow | jq -r '.title')
#    
#    # Check if we have a window to display
#    if [[ -n "$window_class" ]]; then
#        # Output HTML with a dynamic class for Waybar
#        echo "<span class=\"$window_class\">$window_title</span>"
#    else
#        # Fallback for when no window is focused
#        echo "No Active Window"
#    fi
#done


hyprctl sub onwindowfocused "" | while read -r _; do hyprctl -j activewindow | jq -r '"<span class=\"\(.class)\">\(.title)</span>"'; done