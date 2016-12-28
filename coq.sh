#!/bin/sh

if type -p yaourt >/dev/null; then
    yaourt -Sy coq-nox proofgeneral
else
    echo "No yaourt, install coq and proofgeneral manually"
fi
