#!/usr/bin/env zsh
# SPDX-FileCopyrightText: 2023 mattmc3
# SPDX-FileCopyrightText: 2024 Samuel Wu
#
# SPDX-License-Identifier: MIT

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load configurations for zsh plugins
[[ ! -f "${ZDOTDIR:-$HOME}/.zstyles" ]] || source "${ZDOTDIR:-$HOME}/.zstyles"

# Load antidote and zsh plugins
source "${ZDOTDIR:-$HOME}/antidote/antidote.zsh"
antidote load

# Set colors for ls/find/etc
export LS_COLORS="$(vivid generate molokai)"

# Set a smartter cd
source <(zoxide init zsh --cmd cd)

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f "${ZDOTDIR:-$HOME}/.p10k.zsh" ]] || source "${ZDOTDIR:-$HOME}/.p10k.zsh"
