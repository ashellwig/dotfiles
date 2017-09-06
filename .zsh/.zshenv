####################################################
# .zshenv                                         ##
# @ashellwig                                      ##
# Purpose: Provide a defined environement for a   ##
#     non-interactive, non-login shell            ##
####################################################

if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR}/.zprofile" ]]; then
  source "${ZDOTDIR}/.zprofile"
fi