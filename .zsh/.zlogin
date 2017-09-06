####################################################
# .zlogin                                         ##
# @ashellwig                                      ##
# Purpose: Set commands/options for login shells  ##
####################################################

{
  # Compile the Zcompdump
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!