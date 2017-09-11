#!/usr/bin/zsh

###################################
# bootstrap.zsh                  ##
# @ashellwig                     ##
# Purpose: Automate some things  ##
###################################

# --- Variables ---
# Locations
YADMROOTDIR="~/.yadm"

# --- Welcome Message ---
print -f "\n \033[32;5mZsh Bootstrap Initiated!\033[0m"
cd $HOME
# --- Load the Drop-In Bootstraps ---
if [[ -d "${HOME}/.yadm/bootstrap.d" ]]; then
  "${HOME}/.yadm/bootstrap.d/Zsh.zsh"
  # ${YADMROOTDIR}/bootstrap.d/
  # ${YADMROOTDIR}/bootstrap.d/
  # ${YADMROOTDIR}/bootstrap.d/
  # ${YADMROOTDIR}/bootstrap.d/
  print -f "\n\n\e[1;32mDropins Complete!\e[0m"
  cd ${YADMROOTDIR}
fi

# vim: set et ts=2 sw=2:
