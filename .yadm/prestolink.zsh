#!/usr/bin/env zsh

mkdir ~/.zsh
export ZDOTDIR="~/.zsh"
git clone --recursive https://github.com/ashellwig/.zprezto.git "${ZDOTDIR}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR}"/.zpresto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR}/.$rcfile:t}"
done