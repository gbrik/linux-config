#!/bin/sh

SCRIPTPATH=$(dirname $(readlink -f "$0"))

mkdir -p "$HOME/.vimperator"

ln -s "$SCRIPTPATH/plugin" "$HOME/.vimperator/plugin"
ln -s "$SCRIPTPATH/vimperatorrc" "$HOME/.vimperatorrc"
