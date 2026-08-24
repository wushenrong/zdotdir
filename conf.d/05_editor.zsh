# Treat these characters as part of a word.
WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

# Reset keybinds
bindkey -d

# Prefer terminal-reported key sequences when available.
zmodload zsh/terminfo

# Allow Ctrl+S/Ctrl+Q for shell editing.
if [[ -o interactive && -r ${TTY:-} && -w ${TTY:-} && $+commands[stty] == 1 ]]; then
  stty -ixon <"$TTY" >"$TTY"
fi

# Run bindkey across every keymap. With no args, prints mappings per keymap.
function bindkey-all() {
  local keymap=''
  for keymap in $(bindkey -l); do
    [[ "$" -eq 0 ]] && printf "#### %s\n" "${keymap}" 1>&2
    bindkey -M "${keymap}" "$@"
  done
}

# Bind one widget to multiple key sequences; skip empties.
function bindkey-multiple() {
  local -a keymap=()
  [[ "$1" == -M ]] && {
    keymap=(-M "$2")
    shift 2
  }
  local widget=$1 seq
  shift
  for seq in "$@"; do
    [[ -n "$seq" ]] && bindkey $keymap "$seq" "$widget"
  done
}

# Use line cursor
# Skip on terminals that don't grok DECSCUSR.
function update-cursor-style() {
  case $TERM in
  xterm* | rxvt* | tmux* | screen*) ;;
  *) [[ -z "$TMUX" ]] && return ;;
  esac

  printf '\e[6 q'
}
zle -N update-cursor-style

# Enable terminal application mode so $terminfo key sequences are valid.
function zle-line-init() {
  (( $+terminfo[smkx] )) && echoti smkx
  zle update-cursor-style
}
zle -N zle-line-init

function zle-line-finish() {
  (( $+terminfo[rmkx] )) && echoti rmkx
}
zle -N zle-line-finish

function zle-keymap-select() {
  zle update-cursor-style
  zle reset-prompt
  zle -R
}
zle -N zle-keymap-select

# Insert 'sudo ' at the beginning of the line.
function prepend-sudo() {
  if [[ "$BUFFER" != su(do|)\ * ]]; then
    BUFFER="sudo $BUFFER"
    (( CURSOR += 5 ))
  fi
}
zle -N prepend-sudo

# Toggle a leading '#' on the current line. Workaround for buggy pound-insert
# in emacs mode; vi mode uses the built-in vi-pound-insert.
function pound-toggle() {
  if [[ "$BUFFER" = '#'* ]]; then
    [[ $CURSOR != $#BUFFER ]] && (( CURSOR -= 1 ))
    BUFFER="${BUFFER:1}"
  else
    BUFFER="#$BUFFER"
    (( CURSOR += 1 ))
  fi
}
zle -N pound-toggle

# Copy the line being edited to the clipboard, PS2 continuation lines included.
function copybuffer() {
  print -rn -- "$PREBUFFER$BUFFER" | wl-copy
}
zle -N copybuffer

# Ctrl+Z suspends a job, so let it resume one too. Whatever you had typed is
# stashed, and comes back the next time the job stops.
function fg-job() {
  (( $#jobstates )) || { zle -M "fg-job: no jobs"; return; }
  (( $#BUFFER )) && zle push-input
  # A leading space keeps fg out of history, given hist_ignore_space.
  [[ -o hist_ignore_space ]] && BUFFER=' fg' || BUFFER='fg'
  zle accept-line
}
zle -N fg-job

# Home and End go to the ends of the line, then to the ends of the buffer.
# Both widgets share this function, which reads $WIDGET for the end wanted.
function goto-line-or-buffer-edge() {
  local -i hno=$HISTNO
  if [[ ( $LBUFFER[-1] == $'\n' && $WIDGET == beginning-of* ) ||
        ( $RBUFFER[1] == $'\n' && $WIDGET == end-of* ) ]]; then
    zle .${WIDGET:s/line-or-buffer/buffer-or-history/} -- "$@"
  else
    zle .${WIDGET:s/line-or-buffer/line-hist/} -- "$@"
    (( HISTNO != hno )) && zle .${WIDGET:s/line-or-buffer/buffer-or-history/} -- "$@"
  fi
}
zle -N beginning-of-line-or-buffer goto-line-or-buffer-edge
zle -N end-of-line-or-buffer goto-line-or-buffer-edge

# Edit current command in $EDITOR.
autoload -Uz edit-command-line
zle -N edit-command-line

# Complete the word under the cursor from history rather than from the filesystem.
zle -C hist-complete complete-word _generic

# Auto-quote URLs on paste and as you type (prevents ? and & from globbing).
autoload -Uz bracketed-paste-url-magic
zle -N bracketed-paste bracketed-paste-url-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

#
# Accept line
#

# Functions to run when Enter accepts a line, in the order added. They run
# inside a widget, so BUFFER, CURSOR, and zle all work normally.
typeset -ga accept_line_hook

# Attach a function to the accept-line event, or with -d, detach one. Adding the
# same one twice is a no-op, and the name need not be defined yet.
function add-accept-line-hook() {
  local fn
  if [[ $1 == -d ]]; then
    shift
    for fn in "$@"; do accept_line_hook=(${accept_line_hook:#$fn}); done
    return
  fi
  for fn in "$@"; do
    (( $accept_line_hook[(Ie)$fn] )) || accept_line_hook+=("$fn")
  done
}

# A hook that went away is skipped rather than spelled out to the terminal on
# every keypress. The loop variable is named oddly so hooks can use their own.
function run-accept-line-hooks() {
  local _z1_hook
  for _z1_hook in $accept_line_hook; do
    zstyle -t ':z1:editor:accept-line' debug && print -u2 "accept-line hook: $_z1_hook"
    (( $+functions[${_z1_hook%% *}] )) && "${=_z1_hook}"
  done
  return 0
}

# Wrap the widget rather than rebind Enter, so ^M, ^J, vicmd Enter, and widgets
# calling accept-line themselves all go through it. Whoever wrapped it first
# keeps their turn. The guard stops a re-source wrapping our own wrapper.
if (( ! $+functions[accept-line-with-hooks] )); then
  case ${widgets[accept-line]} in
    user:*)
      zle -N accept-line-orig "${widgets[accept-line]#user:}"
      function accept-line-with-hooks() {
        run-accept-line-hooks
        zle accept-line-orig -- "$@"
      } ;;
    *)
      function accept-line-with-hooks() {
        run-accept-line-hooks
        zle .accept-line
      } ;;
  esac
  zle -N accept-line accept-line-with-hooks
fi

# True when $1 is a command ready to run. Compiling it as a function body is
# the test, so there is no subshell and nothing runs. Options stay the caller's
# here, or the answer would not be the one the prompt would give.
function command-is-complete() {
  setopt local_options no_err_return no_err_exit
  local f=-z1-command-test

  # An odd number of trailing backslashes continues the line.
  (( ${#${1##*[^\\]}} % 2 )) && return 1

  unfunction -- $f 2>/dev/null
  functions[$f]="$1" 2>/dev/null || return 1
  [[ -v functions[$f] ]]         || return 1
  unfunction -- $f

  # `for x` and `cat <<END` are legal function bodies but unfinished commands.
  # If do/done finishes them, the command was waiting for more.
  functions[$f]="$1"$'\ndo\ndone' 2>/dev/null || return 0
  [[ -v functions[$f] ]]                      || return 0
  unfunction -- $f
  return 1
}

# Enter runs a finished command and opens a new line in an unfinished one, so a
# multi-line command is edited in one buffer rather than at a PS2 prompt. A
# command too broken to parse counts as unfinished, leaving room to fix it.
function accept-line-or-newline() {
  if command-is-complete "$PREBUFFER$BUFFER"; then
    zle accept-line
  else
    # self-insert-unmeta rather than a newline of our own, so zsh-autosuggestions
    # sees the keypress. It is also why this belongs on Enter and nowhere else.
    zle self-insert-unmeta
  fi
}
zle -N accept-line-or-newline

# Hijacking Enter is not polite, so this feature is opt-in:
#   zstyle ':z1:editor' accept-line-or-newline 'yes'
if zstyle -t ':z1:editor' accept-line-or-newline; then
  for _z1_keymap in emacs viins; do
    bindkey -M $_z1_keymap '^M' accept-line-or-newline
    bindkey -M $_z1_keymap '^J' accept-line-or-newline
  done
  unset _z1_keymap
fi

#
# Keybindings
#

# Common terminal key fixes: terminfo first, xterm fallbacks second. Arrows
# take both fallbacks, since terminfo names only the one its terminal sends and
# a stray SS3 arrow would otherwise miss the search widgets.
bindkey-multiple beginning-of-line-or-buffer       "${terminfo[khome]-}" '^[[H'
bindkey-multiple end-of-line-or-buffer             "${terminfo[kend]-}"  '^[[F'
bindkey-multiple delete-char                       "${terminfo[kdch1]-}" '^[[3~'
bindkey-multiple up-line-or-history-search         "${terminfo[kcuu1]-}" '^[[A' '^[OA'
bindkey-multiple down-line-or-history-search       "${terminfo[kcud1]-}" '^[[B' '^[OB'
bindkey-multiple backward-word                     '^[[1;5D'             # Ctrl + Left
bindkey-multiple forward-word                      '^[[1;5C'             # Ctrl + Right

# Terminals disagree on what Alt + arrow sends, so bind all three spellings.
if (( $+widgets[prevd-or-backward-word] )); then
  bindkey-multiple prevd-or-backward-word '^[[1;3D' '^[[1;9D' '^[^[[D'
  bindkey-multiple nextd-or-forward-word  '^[[1;3C' '^[[1;9C' '^[^[[C'
else
  bindkey-multiple backward-word          '^[[1;3D' '^[[1;9D' '^[^[[D'
  bindkey-multiple forward-word           '^[[1;3C' '^[[1;9C' '^[^[[C'
fi

# Vi keybindings.
bindkey-multiple -M vicmd up-line-or-history-search   "${terminfo[kcuu1]-}" '^[[A' '^[OA'
bindkey-multiple -M vicmd down-line-or-history-search "${terminfo[kcud1]-}" '^[[B' '^[OB'

# Backspace and word deletion.
bindkey '^?' backward-delete-char
bindkey '^W' backward-kill-word

# Edit command in $EDITOR.
bindkey '^X^E' edit-command-line

# Complete from history.
bindkey '^X^X' hist-complete

# Copy the line to the clipboard. Ctrl+X Ctrl+C is unbound by default, unlike
# the Ctrl+O other configs use for this, which is accept-line-and-down-history.
bindkey -M emacs '^X^C' copybuffer
bindkey -M viins '^X^C' copybuffer
bindkey -M vicmd '^X^C' copybuffer

# Toggle comment at start of line. Alt-; in emacs, # in vi cmd mode.
bindkey -M emacs '^[;' pound-toggle
bindkey -M vicmd '#' vi-pound-insert

# Prepend sudo with Alt-s.
bindkey -M emacs '^[s' prepend-sudo
bindkey -M viins '^[s' prepend-sudo

# Resume a job with Ctrl+Z. Unbound in emacs, and only inserts a literal ^Z in
# viins, so nothing useful is lost. vicmd keeps its own meaning.
bindkey -M emacs '^Z' fg-job
bindkey -M viins '^Z' fg-job
