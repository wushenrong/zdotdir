# Defaults
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# Caching
_cache_dir=$XDG_CACHE_HOME/zsh
[[ -d "$_cache_dir" ]] || mkdir -p "$_cache_dir"

_zcompdump="$_cache_dir/zcompdump"
_zcompcache="$_cache_dir/zcompcache-${ZSH_VERSION}"

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "$_zcompcache"

# Case-insensitive (all), partial-word, and then substring completion.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
setopt NO_case_glob

# Completion style

# Add completions
fpath=($XDG_DATA_HOME/zsh/zsh-completions/src $fpath)

# Load and initialize the completion system ignoring insecure directories with a
# cache time of 20 hours, so it should almost always regenerate the first time a
# shell is opened each day.
autoload -Uz compinit
_comp_files=($_zcompdump(Nmh-20))
if (( $#_comp_files )); then
  compinit -i -C -d "$_zcompdump"
else
  compinit -i -d "$_zcompdump"
  # Keep $_zcompdump younger than cache time even if it isn't regenerated.
  touch "$_zcompdump"
fi

unset _cache_dir _comp_files _zcompdump _zcompcache
