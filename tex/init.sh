#! /bin/sh

SCRIPTPATH=$(dirname $(readlink -f "$0"))

if type -p pacman >/dev/null; then
    sudo pacman -Sy texlive-most ghostscript pygmentize
else
    echo "No pacman, install packages from $SCRIPTPATH/tex.sh some other way."
fi

ln -s "$SCRIPTPATH/.latexmkrc" "$HOME/.latexmkrc"
