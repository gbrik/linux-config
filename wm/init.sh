#!/bin/sh

SCRIPTPATH=$(dirname $(readlink -f "$0"))

echo "make sure you have video drivers installed"
echo "see https://wiki.archlinux.org/index.php/xorg#Driver_installation"

if type -p pacman >/dev/null; then
    sudo pacman -Sy \
	       xf86-input-libinput xorg-server xorg-xinit \
	       bspwm sxhkd dmenu \
               compton transset-df \
               adobe-source-code-pro-fonts
else
    echo "No pacman, install packages from $SCRIPTPATH/init.sh some other way."
fi
if type -p yaourt >/dev/null; then
    sudo yaourt -Sy xterm
else
    echo "No yaourt, install packages from $SCRIPTPATH/init.sh some other way."
fi

GETTYDIR=/etc/systemd/system/getty@tty1.service.d

sudo mkdir -p "$GETTYDIR"

echo "
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin gbrik --noclear %I \$TERM
Type=simple" | sudo tee -a "$GETTYDIR/override.conf"

mkdir -p "$HOME/.config/bspwm" "$HOME/.config/sxhkd"

ln -s "$SCRIPTPATH/bspwmrc" "$HOME/.config/bspwm/bspwmrc"
ln -s "$SCRIPTPATH/sxhkdrc" "$HOME/.config/sxhkd/sxhkdrc"
ln -s "$SCRIPTPATH/xinitrc" "$HOME/.xinitrc"
ln -s "$SCRIPTPATH/bash_profile" "$HOME/.bash_profile"
ln -s "$SCRIPTPATH/Xresources" "$HOME/.Xresources"
ln -s "$SCRIPTPATH/bashrc" "$HOME/.bashrc"
