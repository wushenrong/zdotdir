#!/bin/zsh
# SPDX-FileCopyrightText: 2026 Samuel Wu
#
# SPDX-License-Identifier: MIT
#
# .zshrc - Zsh file loaded on login shell sessions.
#

# Execute profile scripts if the base system does not
if [[ ! -f '/etc/zprofile' || ! -f '/etc/zsh/zprofile' ]]; then
  emulate sh -c 'source /etc/profile'
fi
