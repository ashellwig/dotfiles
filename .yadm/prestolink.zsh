#!/usr/bin/env zsh

setopt EXTENDED_GLOB
export ZDOTDIR="~/.zsh"
for rcfile in "${ZDOTDIR}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR}/.${rcfile:t}"
done
