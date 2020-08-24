#!/bin/sh

SCRIPTPATH=$(dirname $(readlink -f "$0"))

if command -v pacman > /dev/null; then
    sudo pacman -Sy emacs ttf-symbola xclip xsel
elif command -v apt > /dev/null; then
    sudo apt install emacs25 xclip xsel
else
    echo "Couldn't install packages"
fi

git clone https://github.com/syl20bnr/spacemacs "$HOME/.emacs.d"

ln -s "$HOME/.emacs.d/private/.spacemacs" "$HOME/.spacemacs"

mkdir -p "$HOME/.config/systemd/user"
ln -s "$SCRIPTPATH/emacs.service" "$HOME/.config/systemd/user/emacs.service"
systemctl --user enable emacs
systemctl --user restart emacs

echo "alias em='emacsclient -t'" >> ~/.bashrc
