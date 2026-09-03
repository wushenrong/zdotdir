# fix common typos
alias quit=exit
alias cls=clear

# aliases from belak/zsh-utils
alias type='type -a'
alias mkdir='mkdir -p'

# Kitty terminal commands
if [[ "$TERM" == xterm-kitty ]]; then
  alias icat='kitten icat'
  alias ssh='kitten ssh'
fi
