#! /bin/sh

SCRIPTPATH=$(dirname $(readlink -f "$0"))

if type -p pacman >/dev/null; then
    sudo pacman -Sy texlive-most ghostscript pygmentize pandoc
elif type -p apt >/dev/null; then
    sudo apt install texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra ghostscript python-pygments pandoc
else
    echo "No pacman, install packages from $SCRIPTPATH/tex.sh some other way."
fi

ln -s "$SCRIPTPATH/.latexmkrc" "$HOME/.latexmkrc"
