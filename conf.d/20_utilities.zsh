# SPDX-FileCopyrightText: 2026 mattmc3
#
# SPDX-License-Identifier: MIT

# Replace the stub run-help (aliased to man) with the real autoload version.
(( $+aliases[run-help] )) && unalias run-help
autoload -Uz run-help
alias help=run-help

if (( ! $+commands[open] && $+commands[xdg-open] )); then
  alias open='xdg-open'
fi

# Copy a file's contents to the clipboard.
function copyfile() {
  emulate -L zsh
  [[ -f "$1" ]] || { print -ru2 -- "copyfile: not a file: ${1:-}"; return 1; }
  wl-copy < "$1"
}

# Copy a path to the clipboard, made absolute. Defaults to $PWD.
function copypath() {
  emulate -L zsh
  local file=${1:-$PWD}
  print -rn -- "${file:a}" | wl-copy
}

# Cross platform `sed -i` syntax.
function sedi {
  # GNU/BSD
  sed --version &>/dev/null && sed -i -- "$@" || sed -i "" "$@"
}

# Make a directory and cd into it, parents included.
function mkcd() {
  emulate -L zsh
  [[ -n "${1:-}" ]] || { print -ru2 -- "mkcd: expecting a directory argument"; return 1; }
  mkdir -p -- "$1" && builtin cd -- "$1"
}

# Make a temp directory and cd into it. An argument prefixes the name. The
# template is spelled out because GNU and BSD mktemp disagree about -t.
function mktmpcd() {
  emulate -L zsh
  local dir tmp=${${TMPDIR:-/tmp}%/}
  dir=$(mktemp -d "$tmp/${1:-tmp}.XXXXXXXX") || return 1
  builtin cd -- "$dir" && print -r -- "$PWD"
}
