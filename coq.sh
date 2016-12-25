#!/bin/sh

if hash yaourt 2>/dev/null; then
    yaourt -Sy coq-nox proofgeneral
else
    echo "No yaourt, install coq and proofgeneral manually"
fi
