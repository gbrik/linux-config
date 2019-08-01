#!/bin/sh

SCRIPTPATH=$(dirname $(readlink -f "$0"))

if type -p pacman >/dev/null; then
    sudo pacman -Sy emacs ttf-symbola
elif type -p apt >/dev/null; then
    sudo apt install emacs25 fonts-symbola
else
    echo "Couldn't install packages"
fi

git clone https://github.com/syl20bnr/spacemacs "$HOME/.emacs.d"

rm -r "$HOME/.emacs.d/private"

ln -s "$SCRIPTPATH/spacemacs-config" "$HOME/.emacs.d/private"
ln -s "$HOME/.emacs.d/private/.spacemacs" "$HOME/.spacemacs"
