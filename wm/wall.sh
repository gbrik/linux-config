#!/bin/sh

if type -p pacman >/dev/null; then
    sudo pacman -Sy --asexplicit feh imagemagick
else
    echo "install feh"
fi

mkdir -p "$HOME/scripts"

git clone https://github.com/dylanaraps/wal "$HOME/scripts/wal"
