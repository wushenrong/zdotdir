#!/usr/bin/env zsh
# SPDX-FileCopyrightText: 2023 mattmc3
# SPDX-FileCopyrightText: 2024 Samuel Wu
#
# SPDX-License-Identifier: MIT

# fix common typos
alias quit=exit
alias cls=clear

# aliases from belak/zsh-utils
alias type="type -a"
alias mkdir="mkdir -p"

# ls
alias ls='eza -F -sName --time-style=long-iso --group-directories-first --git --icons --color-scale all --hyperlink'

alias ll='ls -lh'
alias la='ll -a'
alias l.='ll -d .*'

alias tree='ls -T'

# find
alias find='fd --hyperlink'
alias fD='find -t d'
alias fF='find -t f'

# diff
alias diff=delta

# grep
alias grep=rg
gred() { grep --json | diff }

# tar
alias tar='bsdtar --posix'
alias tarls='bsdtar -tvf'
alias untar='bsdtar -xvf'

# top
alias top=btop

# ps
alias ps=procs

# hexdump/xxd
alias hd=hexyl
alias xxd=hexyl

# print paths and functions
alias print-fpath='for fp in $fpath; do printf "%s\n" "$fp"; done; unset fp'
alias print-path='printf "%s\n" "$PATH" | tr ":" "\n"'
alias print-functions='print -l ${(k)functions[(I)[^_]*]} | sort'

# misc
alias zshrc='${EDITOR} ${ZDOTDIR}/.zshrc'
alias zbench='for i in {1..10}; do /usr/bin/time zsh -lic exit; done'
alias zdot='cd ${ZDOTDIR}'
