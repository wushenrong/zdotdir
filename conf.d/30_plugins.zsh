_plugin_location="$XDG_DATA_HOME/zsh"

# Defer plugins
source "$_plugin_location/zsh-defer/zsh-defer.plugin.zsh"

zsh-defer source "$_plugin_location/fzf-tab/fzf-tab.plugin.zsh"
# Freed-Wu/fzf-tab-source

# Prompt
source "$_plugin_location/powerlevel10k/powerlevel10k.zsh-theme"

# Utilties
# romkatv/zsh-bench kind:path

# Other Fish-like features
source "$_plugin_location/zsh-autopair/zsh-autopair.plugin.zsh"
autopair-init

zsh-defer source "$_plugin_location/fsh/fast-syntax-highlighting.plugin.zsh"
zsh-defer source "$_plugin_location/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
zsh-defer source "$_plugin_location/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh"

# Completions

unset _plugin_location
