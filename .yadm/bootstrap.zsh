#!/bin/zsh

###################################
# bootstrap.zsh                  ##
# @ashellwig                     ##
# Purpose: Automate some things  ##
###################################

# --- Local Variables ---
# Colors
local RED="\e[1;31m"
local GREEN="\e[1;32m"
local YELLOW="\e[1;33m"
local CYAN="\e[1;36m"
local CCLOSE="\e[0m"
# Flashing
local FLASHTEX="\x1b[5m"
local FLASHTEXCLOSE="\x1b[25m"

# --- Welcome Message ---
print -f "\033[32;5mZsh Bootstrap Initiated!\033[0m"

# --- Make sure Zsh is the default ---
