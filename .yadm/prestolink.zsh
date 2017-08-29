#!/usr/bin/env zsh

export ZDOTDIR="~/.zsh"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR}/.${rcfile:t}"
done
