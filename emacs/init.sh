#!/bin/sh

SCRIPTPATH=$(dirname $(readlink -f "$0"))

if type -p pacman >/dev/null; then
    sudo pacman -Sy emacs ttf-symbola xclip xsel
elif type -p apt >/dev/null; then
    sudo apt install emacs25 fonts-symbola xclip xsel
else
    echo "Couldn't install packages"
fi

git clone https://github.com/syl20bnr/spacemacs "$HOME/.emacs.d"

rm -r "$HOME/.emacs.d/private"

ln -s "$SCRIPTPATH/spacemacs-config" "$HOME/.emacs.d/private"
ln -s "$HOME/.emacs.d/private/.spacemacs" "$HOME/.spacemacs"

mkdir -p "$HOME/.config/systemd/user"
ln -s "$SCRIPTPATH/emacs.service" "$HOME/.config/systemd/user/emacs.service"
systemctl --user enable emacs
systemctl --user restart emacs

echo "alias em='emacsclient -t'" >> ~/.bashrc
