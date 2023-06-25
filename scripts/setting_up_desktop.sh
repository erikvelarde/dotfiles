#!/bin/bash

# echo "Installing rust:"
#
# sudo pacman -Rsn rust
# sudo pacman -Rsn rustup
# sudo pacman -Rsn rustc
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#
# source "$HOME/.cargo/env"
#

## Setting up themes
mkdir utils
cd utils
wget -c $(curl -s https://api.github.com/repos/archcraft-os/pkgs/contents/x86_64/archcraft-gtk-theme-sweet-1.0-4-any.pkg.tar.zst | jq -r '.download_url')
wget -c $(curl -s https://api.github.com/repos/archcraft-os/pkgs/contents/x86_64/archcraft-gtk-theme-cyberpunk-1.0-4-any.pkg.tar.zst | jq -r '.download_url')
wget -c $(curl -s https://api.github.com/repos/archcraft-os/pkgs/contents/x86_64/archcraft-gtk-theme-hack-1.0-4-any.pkg.tar.zst | jq -r '.download_url')
tar -xvf archcraft-gtk-theme-cyberpunk-1.0-4-any.pkg.tar.zst archcraft-gtk-theme-hack-1.0-4-any.pkg.tar.zst archcraft-gtk-theme-sweet-1.0-4-any.pkg.tar.zst
sudo mv usr/share/themes/* /usr/share/themes
# rm -rf archcraft-gtk-theme-cyberpunk-1.0-4-any.pkg.tar.zst archcraft-gtk-theme-hack-1.0-4-any.pkg.tar.zst archcraft-gtk-theme-sweet-1.0-4-any.pkg.tar.zst usr

## Setting up icons
wget -c $(curl -s https://api.github.com/repos/archcraft-os/pkgs/contents/x86_64/archcraft-icons-zafiro-1.0-5-any.pkg.tar.zst | jq -r '.download_url')
tar -xvf archcraft-icons-zafiro-1.0-5-any.pkg.tar.zst  tar -xvf archcraft-icons-luna-1.0-5-any.pkg.tar.zst
sudo mv usr/share/icons/* /usr/share/icons
cd ..
rm -rf utils
# rm -rf archcraft-icons-zafiro-1.0-5-any.pkg.tar.zst  tar -xvf archcraft-icons-luna-1.0-5-any.pkg.tar.zst usr
