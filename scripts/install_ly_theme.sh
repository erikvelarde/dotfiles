#!/usr/bin/env bash
# Minimal Catppuccin Mocha look for ly. Only edits known keys in /etc/ly/config.ini; backup at config.ini.bak.
set -euo pipefail
CFG=/etc/ly/config.ini
[ -f "$CFG" ] || { echo "$CFG not found"; exit 1; }
sudo cp -n "$CFG" "$CFG.bak"
set_key() { sudo sed -i "s|^$1 = .*|$1 = $2|" "$CFG"; grep -q "^$1 = $2\$" "$CFG" || { echo "failed to set $1"; exit 1; }; }
set_key bg 0x001E1E2E            # base
set_key fg 0x00CDD6F4            # text
set_key border_fg 0x00CBA6F7     # mauve
set_key error_fg 0x01F38BA8      # red (bold)
set_key box_title ' ly '
set_key clock '%a %d %b  %H:%M'
set_key hide_version_string true
set_key blank_box true
set_key margin_box_h 3
set_key margin_box_v 1
set_key input_len 28
echo "done. Switch to another TTY (Ctrl+Alt+F3) and back, or reboot, to see it."
