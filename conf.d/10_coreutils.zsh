# eza/ls
alias ls='eza -F -sName --time-style=long-iso --group-directories-first --git --icons --color-scale all'

alias ll='ls -lh'
alias la='ll -a'
alias l.='ll -d .*'

alias tree='ls -T'

# zoxide/cd
source <(zoxide init zsh)

# bat/cat
if (( $+commands[bat] )); then
  # export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat --theme=default -plman'"
  # export MANROFFOPT="-c"

  alias -g -- -h='-h 2>&1 | bat -plhelp'
  alias -g -- --help='--help 2>&1 | bat -plhelp'

  alias cat=bat
elif (( $+commands[batcat] )); then
  # export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | batcat --theme=default -plman'"
  # export MANROFFOPT="-c"

  alias -g -- -h='-h 2>&1 | batcat -plhelp'
  alias -g -- --help='--help 2>&1 | batcat -plhelp'

  alias bat=batcat
  alias cat=batcat
fi

# fd/find
alias find=fd
alias fD='find -t d'
alias fF='find -t f'

# delta/diff
alias diff=delta

# grep/rg
alias grep=rg

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
