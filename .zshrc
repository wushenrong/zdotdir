#!/usr/bin/env zsh
# SPDX-FileCopyrightText: 2023 mattmc3
# SPDX-FileCopyrightText: 2024 Samuel Wu
#
# SPDX-License-Identifier: MIT
#
# .zshrc - Zsh file loaded on interactive shell sessions.
#

# Enable Powerlevel10k instant prompt. Should stay close to the top of .zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "$XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set any zstyles you might use for configuration.
[[ ! -f "$ZDOTDIR/.zstyles" ]] || source "$ZDOTDIR/.zstyles"

# Create an amazing Zsh config using antidote plugins.
source "$ZDOTDIR/.antidote/antidote.zsh"
antidote load

# Set colors for ls/find/etc
export LS_COLORS="$(vivid generate molokai)"

# Set a smartter cd
source <(zoxide init zsh --cmd cd)

# Source anything in .zshrc.d.
for _rc in $ZDOTDIR/.zshrc.d/*.zsh; do
  # Ignore tilde files.
  if [[ $_rc:t != '~'* ]]; then
    source "$_rc"
  fi
done
unset _rc

# To customize prompt, run `p10k configure` or edit .p10k.zsh.
[[ ! -f "$ZDOTDIR/.p10k.zsh" ]] || source "$ZDOTDIR/.p10k.zsh"
