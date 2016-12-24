#!/bin/sh

SCRIPTPATH=$(dirname $(readlink -f "$0"))

ln -s "$SCRIPTPATH/.gitconfig" "$HOME/.gitconfig"
