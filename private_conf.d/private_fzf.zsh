# SPDX-FileCopyrightText: 2024 Samuel Wu
#
# SPDX-License-Identifier: MIT

export FZF_DEFAULT_COMMAND="bfs -type f -mindepth 1 -unique -L -exclude -name .git -printf '%P\n'"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND} -color"
export FZF_ALT_C_COMMAND="bfs -type d -mindepth 1 -nohidden -printf '%P\n'"

export FZF_CTRL_T_OPTS="--select-1 --exit-0 --ansi --preview 'less {}'"
export FZF_ALT_C_OPTS="--select-1 --exit-0 --preview 'eza -1F -sName --group-directories-first --icons --color {}'"

source <(fzf --zsh)
