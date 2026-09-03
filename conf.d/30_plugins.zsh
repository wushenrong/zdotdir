_plugin_location="$XDG_DATA_HOME/zsh"

# Defer plugins
source "$_plugin_location/zsh-defer/zsh-defer.plugin.zsh"

zsh-defer source "$_plugin_location/fzf-tab/fzf-tab.plugin.zsh"
zsh-defer source "$_plugin_location/fzf-tab-source/fzf-tab-source.plugin.zsh"

# Prompt
source "$_plugin_location/powerlevel10k/powerlevel10k.zsh-theme"

# Utilties
path+=("$_plugin_location/zsh-bench")

# Other Fish-like features
typeset -gA AUTOPAIR_PAIRS
AUTOPAIR_PAIRS+=("<" ">")

source "$_plugin_location/zsh-autopair/zsh-autopair.plugin.zsh"
autopair-init

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

zsh-defer source "$_plugin_location/fsh/fast-syntax-highlighting.plugin.zsh"
zsh-defer source "$_plugin_location/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
zsh-defer source "$_plugin_location/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"

[[ -v terminfo ]] || zmodload zsh/terminfo

if [[ -n "$terminfo[kcuu1]" ]]; then
  bindkey -M emacs "$terminfo[kcuu1]" history-substring-search-up
  bindkey -M viins "$terminfo[kcuu1]" history-substring-search-up
fi
if [[ -n "$terminfo[kcud1]" ]]; then
  bindkey -M emacs "$terminfo[kcud1]" history-substring-search-down
  bindkey -M viins "$terminfo[kcud1]" history-substring-search-down
fi

unset _plugin_location
