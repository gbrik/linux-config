#!/bin/sh

SCRIPTPATH=$(dirname $(readlink -f "$0"))

if command -v apt &> /dev/null; then
    sudo add-apt-repository ppa:kgilmer/speed-ricer
    sudo apt update
    sudo apt install i3-gaps-wm feh compton undistract-me playerctl zathura

    sudo apt install gobject-introspection libgtk-3-doc libglib2.0-0
    wget http://ftp.nl.debian.org/debian/pool/main/p/playerctl/libplayerctl2_2.0.1-1_amd64.deb
    wget http://ftp.nl.debian.org/debian/pool/main/p/playerctl/playerctl_2.0.1-1_amd64.deb
    sudo dpkg -i libplayerctl2_2.0.1-1_amd64.deb playerctl_2.0.1-1_amd64.deb
    rm libplayerctl2_2.0.1-1_amd64.deb playerctl_2.0.1-1_amd64.deb
else
    echo "Couldn't install packages"
fi

CONFIGPATH="$HOME/.config"
mkdir -p "$CONFIGPATH"
rm -rf "$CONFIGPATH/i3"
ln -s "$SCRIPTPATH/i3" "$CONFIGPATH/i3"
ln -s "$SCRIPTPATH/compton.conf" "$CONFIGPATH/compton.conf"
