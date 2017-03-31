#!/bin/sh

if type -p yaourt >/dev/null; then
    yaourt -Sy icecat
else
    echo "No pacman, install icecat manually"
fi

echo "Install vimperator"
echo "Now run after-plugin.sh"
