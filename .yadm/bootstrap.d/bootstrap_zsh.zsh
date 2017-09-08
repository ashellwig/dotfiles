# vim: set expandtab ft=sh sw=2 ts=2

####################################
# Bootstrap zsh Installation and  ##
# Configuration                   ##
# @ashellwig                      ##
####################################

# --- Functions ---
function changetheshell() {
  if [[ $(echo $SHELL) != "/usr/bin/zsh" ]]; then
    chsh -s "/usr/bin/zsh"
  fi
}

function configclone_pre() {
  if [[ ! -d $HOME/.zsh ]]; then
    print -f "\e[1;31mZsh Config Home not found in \".zsh\"\e[0m"
    mkdir -p ~/.zsh
    export ZDOTDIR='~/.zsh'
    git clone --recursive git@github.com:ashellwig/.zsh.git $ZDOTDIR
  fi
}

function configclone_post() {
  if [[ -d $HOME/.zsh && $(echo $ZDOTDIR) == "${HOME}/.zsh" ]]; then
    print -f "\e[1;32mClone complete. Continuing.\e[0m"
  fi
}

function install_prereqs {
  if [[ ! -d "$ZDOTDIR/functions" ]]
    print -f "\e[1;32mInstalling Prereqs...\e[0m"
    # git clone [ ... ] ${ZDOTDIR}/functions
    # git clone [ ... ] ${ZDOTDIR}/functions
    print -f "\e[1;32mDone\e[0m"
}
