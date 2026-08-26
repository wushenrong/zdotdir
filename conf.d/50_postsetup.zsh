# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if [[ -z "$LESSOPEN" ]] && (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="||/usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# Use `< file` to quickly view the contents of any file.
[[ -n "$READNULLCMD" ]] || READNULLCMD=$PAGER

# Set TTY for gnupg
if [[ -n "$TTY" ]]; then
  export GPG_TTY="$TTY"
else
  export GPG_TTY="$(tty)"
fi
