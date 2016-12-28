#!/bin/sh

if type -p pacman >/dev/null; then
    sudo pacman -Sy icecat
else
    echo "No pacman, install icefox manually"
fi

echo "Install vimperator"
echo "Now run after-plugin.sh"
