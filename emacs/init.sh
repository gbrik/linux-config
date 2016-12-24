#!/bin/sh

SCRIPTPATH=$(dirname $(readlink -f "$0"))

sudo pacman -Sy emacs

git clone https://github.com/syl20bnr/spacemacs "$HOME/.emacs.d"

rm -r "$HOME/.emacs.d/private"

ln -s "$SCRIPTPATH/spacemacs-config" "$HOME/.emacs.d/private"
ln -s "$HOME/.emacs.d/private/.spacemacs" "$HOME/.spacemacs"
