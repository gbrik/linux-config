#!/bin/sh

SCRIPTPATH=$(dirname $(readlink -f "$0"))

if command -v apt > /dev/null; then
    sudo apt install -y kitty
else
    echo "Couldn't install packages"
fi

CONFIGPATH="$HOME/.config"
mkdir -p "$CONFIGPATH"
rm -rf "$CONFIGPATH/kitty"
ln -s "$SCRIPTPATH/kitty" "$CONFIGPATH/kitty"
