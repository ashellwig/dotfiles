####################################################
# .zlogin                                         ##
# @ashellwig                                      ##
# Purpose: Set environment/options for            ##
#    login shells                                 ##
####################################################

# --- Variables ---
# ZDOT
export ZDOTDIR=/home/ahellwig/.zsh
# Browser
Export BROWSER='chromium'
# Editor
export EDITOR='vim'
export VISUAL='vim'
export VI='vim'
export PAGER='less'
# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi
# LESS
export LESS='-F -g -i -M -R -S -w -X -z-4'
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# --- Path ---
typeset -gU cdpath fpath mailpath path
# Directories
cdpath=(
  $cdpath
)
# Programs
path=(
  /usr/local/{bin,sbin}
  ## Varibles
  R1VM241=~/.rvm/gems/ruby-2.41/bin
  R1VLAST=~/.rvmbin
  ANA1=~/anaconda3/bin
  RUST1=~/.cargo/bin:~/parity/target/release
  PARITYPATHDIR=~/parity/target/release
  LOCALBINDIR=~/.local/bin
  CONDAPATHPROF=~/anaconda3/bin

  export PATH=${R1VM241}:${ANA1}:${RUST1}:${LOCALBINDIR}:${CONDAPATHPROF}:$PATH:${R1VMLAST}
)