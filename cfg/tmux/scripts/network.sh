#!/bin/bash

NET=$(ip -4 route show default | awk '{print $5}' | head -1)

if [ -z "$NET" ]; then
    echo " 睊 no network"
else
    DOWN=$(cat /sys/class/net/$NET/statistics/rx_bytes 2>/dev/null || echo 0)
    UP=$(cat /sys/class/net/$NET/statistics/tx_bytes 2>/dev/null || echo 0)
    DOWN=$(numfmt --to=iec $DOWN 2>/dev/null || echo "$DOWN")
    UP=$(numfmt --to=iec $UP 2>/dev/null || echo "$UP")
    echo " 翔 $NET ↓$DOWN"
fi