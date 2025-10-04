#!/usr/bin/env zsh
# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT

# Execute profile scripts if the base system does not
if [[ ! -f "/etc/zprofile" || ! -f "/etc/zsh/zprofile" ]]; then
  emulate sh -c 'source /etc/profile'
fi
