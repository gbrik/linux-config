#!/bin/sh

SCRIPTPATH=$(dirname $(readlink -f "$0"))

if command -v apt > /dev/null; then
	sudo apt install fonts-font-awesome fonts-symbola
else
	echo "Couldn't install packages"
	exit 1
fi

mkdir -p ~/.local/share/fonts
ln -s $SCRIPTPATH/fonts/* ~/.local/share/fonts/
