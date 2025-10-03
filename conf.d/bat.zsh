# SPDX-FileCopyrightText: 2024 Samuel Wu
#
# SPDX-License-Identifier: MIT

if (( $+commands[bat] )); then
  export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat --theme=default -plman'"
  export MANROFFOPT="-c"

  alias -g -- -h='-h 2>&1 | bat -plhelp'
  alias -g -- --help='--help 2>&1 | bat -plhelp'

  alias cat=bat
elif (( $+commands[batcat] )); then
  export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | batcat --theme=default -plman'"
  export MANROFFOPT="-c"

  alias -g -- -h='-h 2>&1 | batcat -plhelp'
  alias -g -- --help='--help 2>&1 | batcat -plhelp'

  alias bat=batcat
  alias cat=batcat
fi
