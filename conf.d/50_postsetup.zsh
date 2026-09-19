# SPDX-FileCopyrightText: 2026 mattmc3
#
# SPDX-License-Identifier: MIT

# Browser, Editor, Pager
if [[ -n "$WAYLAND_DISPLAY" ]]; then
  export EDITOR="code --wait"
  export BROWSER=firefox
else
  export EDITOR=${EDITOR:-nano}
  export BROWSER=elinks
fi

export PAGER=${PAGER:-less}
export LESS="${LESS:--g -i -M -R -S -w -z-4}"

# Locale
export TIME_STYLE=long-iso

# Set the Less input preprocessor if it's not set.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if [[ -z "$LESSOPEN" ]] && (($#commands[(i)lesspipe(|.sh)])); then
  export LESSOPEN="||/usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Set TTY for gnupg if not set
if [[ -z "$GPG_TTY" ]]; then
  if [[ -n "$TTY" ]]; then
    export GPG_TTY="$TTY"
  else
    export GPG_TTY="$(tty)"
  fi
fi
