_plugin_location="$XDG_DATA_HOME/zsh"

# Defer plugins
source "$_plugin_location/zsh-defer/zsh-defer.plugin.zsh"

zsh-defer source "$_plugin_location/fzf-tab/fzf-tab.plugin.zsh"
# Freed-Wu/fzf-tab-source

# Prompt
source "$_plugin_location/powerlevel10k/powerlevel10k.zsh-theme"

# Utilties
path+=("$_plugin_location/zsh-bench")

# Other Fish-like features
typeset -gA AUTOPAIR_PAIRS
AUTOPAIR_PAIRS+=("<" ">")

source "$_plugin_location/zsh-autopair/zsh-autopair.plugin.zsh"
autopair-init

zsh-defer source "$_plugin_location/fsh/fast-syntax-highlighting.plugin.zsh"
zsh-defer source "$_plugin_location/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
zsh-defer source "$_plugin_location/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"

unset _plugin_location
