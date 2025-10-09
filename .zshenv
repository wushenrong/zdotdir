# Bootstrap ZDOTDIR
export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

# Applications

# GTK
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc:${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc.mine"

# GPG
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"

# Ripgrep
export RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME:-$HOME/.config}/ripgrep/config"

# Wget
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wgetrc"

# Languages

# Dotnet
export DOTNET_CLI_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/dotnet"

export DOTNET_CLI_TELEMETRY_OPTOUT=true
export POWERSHELL_TELEMETRY_OPTOUT=true

export NUGET_PACKAGES="${XDG_CACHE_HOME:-$HOME/.cache}/NuGetPackages"

# Go
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export GOMODCACHE="${XDG_CACHE_HOME:-$HOME/.cache}/go/mod"

# Nodejs
export NODE_REPL_HISTORY="${XDG_DATA_HOME:-$HOME/.local/share}/node_repl_history"

export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/npm/npmrc"

# Python
export PYTHON_HISTORY="${XDG_STATE_HOME:-$HOME/.local/state}/python_history"

# Rust
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"

# Java
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME:-$HOME/.config}/java -Djavafx.cachedir=${XDG_CACHE_HOME:-$HOME/.cache}/openjfx"

export MAVEN_OPTS="-Dmaven.repo.local=${XDG_DATA_HOME:-$HOME/.local/share}/maven/repository"
export MAVEN_ARGS="--settings ${XDG_CONFIG_HOME:-$HOME/.config}/maven/settings.xml"
