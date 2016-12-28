#!/bin/sh

SCRIPTPATH=$(dirname $(readlink -f "$0"))

if type -p pacman >/dev/null; then
    sudo pacman -Sy --asexplicit feh imagemagick
else
    echo "install feh and imagemagick"
fi

mkdir -p "$HOME/scripts"

ln -s "$SCRIPTPATH/wal/wal" "$HOME/scripts/wal"
