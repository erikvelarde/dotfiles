#!/bin/bash

BATTERY=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || echo "0")
CHARGING=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null | grep -i "charging\|full" || echo "")

if [ "$CHARGING" != "" ]; then
    echo "  ${BATTERY}%"
elif [ "$BATTERY" -gt 80 ]; then
    echo "  ${BATTERY}%"
elif [ "$BATTERY" -gt 60 ]; then
    echo "  ${BATTERY}%"
elif [ "$BATTERY" -gt 40 ]; then
    echo "  ${BATTERY}%"
elif [ "$BATTERY" -gt 20 ]; then
    echo "  ${BATTERY}%"
else
    echo "  ${BATTERY}%"
fi