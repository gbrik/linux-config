#!/bin/sh

SCRIPTPATH=$(dirname $(readlink -f "$0"))

if hash pacman 2>/dev/null; then
    sudo pacman -Sy emacs
else
    echo "No pacman, install emacs some other way"
fi

git clone https://github.com/syl20bnr/spacemacs "$HOME/.emacs.d"

rm -r "$HOME/.emacs.d/private"

ln -s "$SCRIPTPATH/spacemacs-config" "$HOME/.emacs.d/private"
ln -s "$HOME/.emacs.d/private/.spacemacs" "$HOME/.spacemacs"
