#!/usr/bin/zsh

if [[ ! -v $RED_COL ]]; then
  source ./lib_colors.zsh
fi

# --- Functions ---
function changetheshell() {
  if [[ $(echo $SHELL) != "/usr/bin/zsh" ]]; then
    chsh -s "/usr/bin/zsh"
  fi
}

function configclone_bef() {
  if [[ ! -d $HOME/.zsh ]]; then
    print -f "${RED_COL}Zsh Config Home not found in \".zsh\"$NO_COL"
    if [[ -v $ZDOTDIR ]]; then
      git clone --recursive git@github.com:ashellwig/.zsh.git $ZDOTDIR
    else
      export ZDOTDIR=$HOME/.zsh
      git clone --recursive git@github.com:ashellwig/.zsh.git $ZDOTDIR
    fi
  fi
}

function configclone_af() {
  if [[ -d $HOME/.zsh && $(echo $ZDOTDIR) == "${HOME}/.zsh" ]]; then
    print -f "\n $GREEN_COL${ITALIC_EF}Clone complete. Continuing.$NO_COL"
  fi
}

function install_prereqs() {
  if [[ ! -d "$ZDOTDIR/functions" ]]; then
    if [[ -a "$ZDOTDIR/functions/powerlevel9k" || -e "$ZDOTDIR/functions/
      zsh-syntax-highlighting" ]]
    print -f "\n \e[1;33mInstalling Prereqs...$NO_COL"
    git clone https://github.com/bhilburn/powerlevel9k.git ${ZDOTDIR}/functions
    git clone https://github.com/zsh-users/zsh-history-substring-search/zsh-history-substring-search.zsh ${ZDOTDIR}/functions.d
    print -f "\n \e[1;32mDone\e[0m"
  fi
}

# --- Calls to Functions ---
function callthefunction() {
  print -f "\n [1;33m--- Bootstrapping Zsh Config ---[0m"
  changetheshell &&
    configclone_bef &&
    configclone_af &&
    install_prereqs &&
    print -f "\n [1;32m Config of Zsh complete![0m"
  return 0
}

callthefunction

# vim: set et ft=zsh sw=2 ts=2:
