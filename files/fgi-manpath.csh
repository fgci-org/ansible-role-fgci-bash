#!/bin/tcsh
# Set the manpath explicitly, so MANPATH overwrites won't hide system man pages

if ! $?MANPATH then
 setenv MANPATH
endif
setenv MANPATH "${MANPATH}:"`man -w` 

