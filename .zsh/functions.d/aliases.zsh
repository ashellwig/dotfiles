####################################################
# aliases.zsh                                     ##
# @ashellwig                                      ##
# Purpose: Set-up command aliases                 ##
####################################################

# --- Colors ---
# ls
alias ls="ls --color=always"
# dmesg
alias kernellogs="dmesg --human --color=always | most"

# --- Movement ---
# i3
alias i3r="i3-msg move workspace to output right"
alias i3l="i3-msg move workspace to output left"

# --- System Management ---
# Zsh
alias szs="source ~/.zsh/.zshrc"
# Arch
alias sc="systemctl"
alias jc="journalctl | most"