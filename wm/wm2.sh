#!/bin/sh

SCRIPTPATH=$(dirname $(readlink -f "$0"))

ln -s "$SCRIPTPATH/bspwmrc" "$HOME/.config/bspwm/bspwmrc"
ln -s "$SCRIPTPATH/sxhkdrc" "$HOME/.config/sxhkd/sxhkdrc"
