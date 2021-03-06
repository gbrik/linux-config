#!/bin/sh

SCRIPTPATH=$(dirname $(readlink -f "$0"))

if command -v apt > /dev/null; then
    sudo apt install -y zsh
else
    echo "Couldn't install packages"
fi

ln -s $SCRIPTPATH/.zshrc $HOME/

echo "install antibody then run"
echo "$ antibody bundle < .zsh_plugins > .zsh_plugins.sh"
