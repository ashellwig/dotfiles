#!/usr/bin/env zsh

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR}"/.zpresto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR}/.$rcfile:t}"
done