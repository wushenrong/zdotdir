# SPDX-FileCopyrightText: 2026 mattmc3
#
# SPDX-License-Identifier: MIT

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if [[ -z "$LESSOPEN" ]] && (($#commands[(i)lesspipe(|.sh)])); then
  export LESSOPEN="||/usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Use `< file` to quickly view the contents of any file.
[[ -n "$READNULLCMD" ]] || READNULLCMD=$PAGER

# Set TTY for gnupg
if [[ -n "$TTY" ]]; then
  export GPG_TTY="$TTY"
else
  export GPG_TTY="$(tty)"
fi

# Bind history substring to arrow keys
[[ -v terminfo ]] || zmodload zsh/terminfo

if [[ -n "$terminfo[kcuu1]" ]]; then
  bindkey -M emacs "$terminfo[kcuu1]" history-substring-search-up
  bindkey -M viins "$terminfo[kcuu1]" history-substring-search-up
fi

if [[ -n "$terminfo[kcud1]" ]]; then
  bindkey -M emacs "$terminfo[kcud1]" history-substring-search-down
  bindkey -M viins "$terminfo[kcud1]" history-substring-search-down
fi
