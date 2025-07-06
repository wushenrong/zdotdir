# SPDX-FileCopyrightText: 2024 Samuel Wu
#
# SPDX-License-Identifier: MIT

if [[ -n $TTY ]]; then
  export GPG_TTY="$TTY"
else
  export GPG_TTY="$(tty)"
fi

if [[ -n $WSLENV ]]; then
  export SSH_SK_HELPER="/mnt/c/Program Files/OpenSSH/ssh-sk-helper.exe"
fi
