# SPDX-FileCopyrightText: 2026 mattmc3
# SPDX-FileCopyrightText: 2026 Samuel Wu
#
# SPDX-License-Identifier: MIT

# Plugin manager from mattmc3/zsh_unplugged
function plugin-clone {
  local plugin repo commitsha plugdir initfile initfiles=()
  for plugin in $@; do
    repo="$plugin"
    clone_args=(-q --depth 1 --recursive --shallow-submodules)
    # Pin repo to a specific commit sha if provided
    if [[ "$plugin" == *'@'* ]]; then
      repo="${plugin%@*}"
      commitsha="${plugin#*@}"
      clone_args+=(--no-checkout)
    fi
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone "${clone_args[@]}" https://github.com/$repo $plugdir
      if [[ -n "$commitsha" ]]; then
        git -C $plugdir fetch -q origin "$commitsha"
        git -C $plugdir checkout -q "$commitsha"
      fi
    fi
    if [[ ! -e $initfile ]]; then
      initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
      (($#initfiles)) && ln -sf $initfiles[1] $initfile
    fi
  done
}

# Download all plugins before initialization
repos=(
  'Aloxaf/fzf-tab'
  'Freed-Wu/fzf-tab-source'
  'romkatv/powerlevel10k'
  'romkatv/zsh-bench'
  'romkatv/zsh-defer'
  'hlissner/zsh-autopair'
  'zdharma-continuum/fast-syntax-highlighting'
  'zsh-users/zsh-autosuggestions'
  'zsh-users/zsh-completions'
  'zsh-users/zsh-history-substring-search'
)

plugin-clone $repos

# Add zsh-bench to PATH
path+=($ZPLUGINDIR/zsh-bench)
