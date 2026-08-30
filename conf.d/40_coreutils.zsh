# eza/ls
alias ls='eza -F -sName --group-directories-first --git --icons --hyperlink --color-scale=all'

alias ll='ls -lh'
alias la='ll -a'
alias l.='ll -d .*'

alias tree='ls -T'

# zoxide/cd
source <(zoxide init zsh)

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
gred() { grep --json "$1" | diff; }

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
