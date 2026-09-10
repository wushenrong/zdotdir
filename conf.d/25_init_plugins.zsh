# SPDX-FileCopyrightText: 2026 mattmc3
# SPDX-FileCopyrightText: 2026 Samuel Wu
#
# SPDX-License-Identifier: MIT

# Plugin manager from mattmc3/zsh_unplugged
function plugin-source {
  local plugdir
  for plugdir in $@; do
    [[ $plugdir = /* ]] || plugdir=$ZPLUGINDIR/$plugdir
    fpath+=$plugdir
    local initfile=$plugdir/${plugdir:t}.plugin.zsh
    source $initfile
  done
}

# Initialize plugins
plugins=(
  powerlevel10k

  fzf-tab
  fzf-tab-source

  zsh-autopair
  fast-syntax-highlighting
  zsh-autosuggestions
  zsh-history-substring-search
)

plugin-source $plugins
