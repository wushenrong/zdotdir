# SPDX-FileCopyrightText: 2009-2011 Robby Russell and contributors
# SPDX-FileCopyrightText: 2011-2017 Sorin Ionescu and contributors
# SPDX-FileCopyrightText: 2018-2019 Kaleb Elwert and contributors
# SPDX-FileCopyrightText: 2026 mattmc3
# SPDX-FileCopyrightText: 2026 Samuel Wu
#
# SPDX-License-Identifier: MIT

# fix common typos
alias quit=exit
alias cls=clear

# aliases from belak/zsh-utils
alias type='type -a'
alias mkdir='mkdir -p'

# Kitty terminal commands
if [[ "$TERM" == *kitty* ]]; then
  alias icat='kitten icat'
  alias ssh='kitten ssh'
fi

# eza/ls
alias ls='eza -F -sName --group-directories-first --git --icons --hyperlink --color-scale=all'

alias ll='ls -lh'
alias la='ll -a'
alias l.='ll -d .*'

alias tree='ls -T'

# zoxide/cd
source <(zoxide init zsh --cmd cd)

# bat/cat
local _which_bat
if (( $+commands[bat] )); then
  _which_bat=bat
elif (( $+commands[batcat] )); then
  _which_bat=batcat
fi

export MANPAGER="${_which_bat} --strip-ansi=always -plman"

alias -g -- -h="-h 2>&1 | ${_which_bat} -plhelp"
alias -g -- --help="--help 2>&1 | ${_which_bat} -plhelp"

alias cat="${_which_bat}"

unset _which_bat

# fd/find
alias find=fd
alias fD='find -t d'
alias fF='find -t f'

# delta/diff
alias diff=delta

# grep/ripgrep
alias grep=rg
gred() { rg --json "$1" | delta; }

# bsdtar/gnutar
alias tar='bsdtar --posix'
alias tarls='bsdtar -tvf'
alias untar='bsdtar -xvf'

# btop/top
alias top=btop

# fastfetch/fetch
alias fetch=fastfetch

# procs/ps
alias ps=procs

# duf/df
alias df=duf

# gdu/du
alias du=gdu

# hexyl/hexdump/xxd
alias hd=hexyl
alias xxd=hexyl
