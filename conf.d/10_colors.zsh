# Built-in zsh colors.
autoload -Uz colors && colors

# Colorize man pages.
export LESS_TERMCAP_md=${LESS_TERMCAP_md:-$fg_bold[blue]}  # start bold
export LESS_TERMCAP_mb=${LESS_TERMCAP_mb:-$fg_bold[blue]}  # start blink
export LESS_TERMCAP_so=${LESS_TERMCAP_so:-$'\e[00;47;30m'} # start standout: white bg, black fg
export LESS_TERMCAP_us=${LESS_TERMCAP_us:-$'\e[04;35m'}    # start underline: underline magenta
export LESS_TERMCAP_se=${LESS_TERMCAP_se:-$reset_color}    # end standout
export LESS_TERMCAP_ue=${LESS_TERMCAP_ue:-$reset_color}    # end underline
export LESS_TERMCAP_me=${LESS_TERMCAP_me:-$reset_color}    # end bold/blink

export LS_COLORS="$(vivid generate molokai)"

# Colorize completions.
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
