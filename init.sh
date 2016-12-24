#! /bin/sh

systemctl enable NetworkManager
systemctl start NetworkManager
echo "Make sure you have internet access"

sudo pacman -Sy vim
