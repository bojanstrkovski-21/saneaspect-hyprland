#!/bin/bash

# Script to reload Waybar

## Terminate any running Waybar instances
#pkill waybar
#
## Wait to ensure Waybar has fully terminated
#sleep 0.5
#
## Check if Waybar is still running
#if pgrep -f waybar > /dev/null; then
#    notify-send "Waybar reload failed" "Could not terminate existing Waybar processes" -t 3000
#    exit 1
#fi
#
## Verify Waybar binary exists
#if ! command -v waybar &> /dev/null; then
#    notify-send "Waybar reload failed" "Waybar binary not found in PATH" -t 3000
#    exit 1
#fi
#
## Relaunch Waybar and log output for debugging
#waybar > ~/.waybar.log 2>&1 &
#
## Wait briefly to check if Waybar started successfully
#sleep 1
#if pgrep -f waybar > /dev/null; then
#    notify-send "Waybar reloaded" "Waybar has been successfully restarted" -t 2000
#else
#    notify-send "Waybar reload failed" "Check ~/.waybar.log for details" -t 3000
#    exit 1
#fi

# Terminate any running Waybar instances
pkill waybar

# Wait to ensure Waybar has fully terminated
sleep 0.5

# Check if Waybar is still running
if pgrep waybar > /dev/null; then
    notify-send "Waybar reload failed" "Could not terminate existing Waybar processes" -t 3000
    exit 1
fi

# Verify Waybar binary exists
if ! command -v waybar &> /dev/null; then
    notify-send "Waybar reload failed" "Waybar binary not found in PATH" -t 3000
    exit 1
fi

# Relaunch Waybar with explicit config and style, logging output
waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css > ~/.waybar.log 2>&1 &

# Wait briefly to check if Waybar started
sleep 1
if pgrep waybar > /dev/null; then
    notify-send "Waybar reloaded" "Waybar has been successfully restarted" -t 2000
else
    notify-send "Waybar reload failed" "Check ~/.waybar.log for details" -t 3000
    exit 1
fi