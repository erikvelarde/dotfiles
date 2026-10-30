#!/usr/bin/env bash
# Installs the Catppuccin Mocha GRUB theme. Backs up config first; revert by removing GRUB_THEME and regenerating.
set -euo pipefail
SRC="$(cd "$(dirname "$0")/.." && pwd)/cfg/grub/catppuccin-mocha-grub-theme"
DEST=/boot/grub/themes/catppuccin-mocha
[ -f "$SRC/theme.txt" ] || { echo "theme.txt missing"; exit 1; }
sudo cp -n /etc/default/grub /etc/default/grub.bak
sudo cp -n /boot/grub/grub.cfg /boot/grub/grub.cfg.bak
sudo mkdir -p "$DEST" && sudo cp -r "$SRC"/. "$DEST"/
if grep -q '^GRUB_THEME=' /etc/default/grub; then
  sudo sed -i "s|^GRUB_THEME=.*|GRUB_THEME=\"$DEST/theme.txt\"|" /etc/default/grub
else
  echo "GRUB_THEME=\"$DEST/theme.txt\"" | sudo tee -a /etc/default/grub >/dev/null
fi
sudo sed -i 's|^GRUB_GFXMODE=.*|GRUB_GFXMODE=1920x1080,auto|' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
