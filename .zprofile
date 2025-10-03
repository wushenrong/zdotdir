#!/usr/bin/env zsh
# SPDX-FileCopyrightText: 2025 Samuel Wu
#
# SPDX-License-Identifier: MIT

# Execute profile scripts that zsh does not
if [[ ! -f "/etc/zprofile" ]]; then
  emulate sh -c 'source /etc/profile'
fi
