#!/usr/bin/zsh

if [[ ! -v $RED_COL ]]; then
  source "${HOME}/.yadm/bootstrap.d/lib_colors.zsh"
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
      git clone --recursive https://github.com/ashellwig/.zsh.git $ZDOTDIR
      git submodule update --init --recursive
    else
      export ZDOTDIR=$HOME/.zsh
      git clone --recursive https://github.com/ashellwig/.zsh.git $ZDOTDIR
      git submodule update --init --recursive
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
       ${ZDOTDIR}/functions
    git clone https://github.com/zsh-users/zsh-history-substring-search/zsh-history-substring-search.zsh ${ZDOTDIR}/functions.d
    print -f "\n \e[1;32mDone\e[0m"
  fi
}

# --- Calls to Functions ---
function callthefunction() {
  local error_message="\033[1;31mFailed at previous command \033[0m"

  print -f "\n [1;33m--- Bootstrapping Zsh Config ---[0m"
  changetheshell &&
    configclone_bef &&
    configclone_af &&
    install_prereqs &&
    print -f "\n [1;32m Config of Zsh complete![0m"
  return 0
  if [[ "$!" -ne 0 ]]; then
    printf "${error_message}"
  fi
}

callthefunction

for func in "${HOME}/.yadm/bootstrap.d/*.zsh"; do
  unfunction "${func}"
done

# vim: set et ft=zsh sw=2 ts=2:
