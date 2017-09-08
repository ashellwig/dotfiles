#!/bin/zsh

###################################
# bootstrap.zsh                  ##
# @ashellwig                     ##
# Purpose: Automate some things  ##
###################################

# --- Variables ---
# Colors
RED="\e[1;31m"
GREEN="\e[1;32m"
YELLOW="\e[1;33m"
CYAN="\e[1;36m"
CCLOSE="\e[0m"
# Flashing
FLASHTEX="\x1b[5m"
FLASHTEXCLOSE="\x1b[25m"
# Locations
YADMROOTDIR="~/.yadm"

# --- Welcome Message ---
print -f "\033[32;5mZsh Bootstrap Initiated!\033[0m"
cd $HOME
# --- Load the Drop-In Bootstraps ---
if [[ ! -d $YADMROOTDIR/bootstrap.d ]]; then
  mkdir -p $YADMROOTDIR/bootstrap.d
fi
if [[ -d $YADMROOTDIR/bootstrap.d ]]; then
  # ${YADMROOTDIR}/bootstrap.d/
  # ${YADMROOTDIR}/bootstrap.d/
  # ${YADMROOTDIR}/bootstrap.d/
  # ${YADMROOTDIR}/bootstrap.d/
  # ${YADMROOTDIR}/bootstrap.d/
  print -f "${GREEN}Dropins Complete!"
fi

# vim: set ft=sh ts=2 sw=2
