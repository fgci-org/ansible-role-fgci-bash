#!/bin/bash
# Set the manpath explicitly, so MANPATH overwrites won't hide system man pages

export MANPATH=$MANPATH:`man -w` 
