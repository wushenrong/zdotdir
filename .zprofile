#!/bin/zsh
#
# .zshrc - Zsh file loaded on login shell sessions.
#

# Execute profile scripts if the base system does not
if [[ ! -f '/etc/zprofile' || ! -f '/etc/zsh/zprofile' ]]; then
  emulate sh -c 'source /etc/profile'
fi
