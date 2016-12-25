#! /bin/sh

SCRIPTPATH=$(dirname $(readlink -f "$0"))

systemctl enable NetworkManager
systemctl start NetworkManager
echo "Make sure you have internet access"

sudo pacman -Sy vim

ln -s "$SCRIPTPATH/.yaourtrc" "$HOME/.yaourtrc"
