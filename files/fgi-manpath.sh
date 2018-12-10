#!/bin/bash
# Set the manpath explicitly, so MANPATH overwrites won't hide system man pages

if mancmd=$(command -v man); then
    export MANPATH=$MANPATH:$(${mancmd} -w)
fi
