# fix common typos
alias quit=exit
alias cls=clear

# aliases from belak/zsh-utils
alias type='type -a'
alias mkdir='mkdir -p'

# Grep with diff
gred() { grep --json | diff; }

# Use XDG for wget
alias wget="wget --hsts-file=$XDG_STATE_HOME/wget-hsts"

# Set history aliases.
alias hist='fc -li'
alias histsync='fc -RI'
alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

# print paths and functions
alias print-fpath='for fp in $fpath; do printf "%s\n" "$fp"; done; unset fp'
alias print-path='printf "%s\n" "${PATH}" | tr ":" "\n"'
alias print-functions='print -l ${(k)functions[(I)[^_]*]} | sort'

# Print a simple colormap.
alias colormap='for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+"\n"}; done'
