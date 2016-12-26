#!/bin/sh

SCRIPTPATH=$(dirname $(readlink -f "$0"))

echo "make sure you have video drivers installed"
echo "see https://wiki.archlinux.org/index.php/xorg#Driver_installation"

if hash pacman 2>/dev/null; then
    sudo pacman -Sy \
	       xf86-input-libinput xorg-server xorg-xinit \
	       rxvt-unicode bspwm sxhkd dmenu compton
else
    echo "No pacman, install packages from $SCRIPTPATH/init.sh some other way."

echo "
if [ -z \"\$DISPLAY\" ] && [ -n \"\$XDG_VTNR\" ] && [ \"\$XDG_VTNR\" -eq 1 ]; then
  exec startx
fi" >> "$HOME/.bash_profile"

GETTYDIR=/etc/systemd/system/getty@tty1.service.d

sudo mkdir -p "$GETTYDIR"

echo "
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin gbrik --noclear %I \$TERM
Type=simple" | sudo tee -a "$GETTYDIR/override.conf"

echo "exec bspwm" >> "$HOME/.xinitrc"

mkdir -p "$HOME/.config/bspwm" "$HOME/.config/sxhkd"

ln -s "$SCRIPTPATH/bspwmrc" "$HOME/.config/bspwm/bspwmrc"
ln -s "$SCRIPTPATH/sxhkdrc" "$HOME/.config/sxhkd/sxhkdrc"
fi
