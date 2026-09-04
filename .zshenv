#!/bin/bash
#
# .zshenv - Zsh environment file, loaded always.
#

# Bootstrap XDG Base Dirs
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}

# Bootstrap ZDOTDIR
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

# Claude
export CLAUDE_CONFIG_DIR=$XDG_CONFIG_HOME/claude

# Copilot
export COPILOT_HOME=$XDG_CONFIG_HOME/copilot

# Fzf
export FZF_DEFAULT_OPTS_FILE=$XDG_CONFIG_HOME/fzf/config

# GDB
export GDBHISTFILE=$XDG_STATE_HOME/gdb_history

# GPG
export GNUPGHOME=$XDG_DATA_HOME/gnupg

# GTK
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc:$XDG_CONFIG_HOME/gtk-2.0/gtkrc.mine"

# LESS
export LESSKEY=$XDG_CONFIG_HOME/lesskey
export LESSHISTFILE=$XDG_STATE_HOME/lesshst

# Ripgrep
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep/config

# Wget
export WGETRC=$XDG_CONFIG_HOME/wgetrc

#
# Languages
#

# Dotnet
export DOTNET_CLI_HOME=$XDG_DATA_HOME/dotnet
export NUGET_PACKAGES=$XDG_CACHE_HOME/NuGetPackages
export NUGET_CONFIGFILE=$XDG_CONFIG_HOME/NuGet/NuGet.Config

export DOTNET_CLI_TELEMETRY_OPTOUT=true
export POWERSHELL_TELEMETRY_OPTOUT=true
export VCPKG_DISABLE_METRICS=true

# Go
export GOPATH=$XDG_DATA_HOME/go
export GOMODCACHE=$XDG_CACHE_HOME/go/mod

# Java
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java -Djavafx.cachedir=$XDG_CACHE_HOME/openjfx"

export MAVEN_OPTS="-Dmaven.repo.local=$XDG_DATA_HOME/maven/repository"
export MAVEN_ARGS="--settings $XDG_CONFIG_HOME/maven/settings.xml"

# Nodejs
export NODE_REPL_HISTORY=$XDG_STATE_HOME/node_repl_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NPM_CONFIG_CACHE=$XDG_CACHE_HOME/npm

# Python
export PYTHON_HISTORY=$XDG_STATE_HOME/python_history

export IPYTHONDIR=$XDG_CONFIG_HOME/ipython
export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter

# Ruby
export IRBRC=$XDG_CONFIG_HOME/irb/irbrc

export BUNDLE_USER_CONFIG=$XDG_CONFIG_HOME/bundle/config
export BUNDLE_USER_CACHE=$XDG_CACHE_HOME/bundle
export BUNDLE_USER_PLUGIN=$XDG_DATA_HOME/bundle

# Rust
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export CARGO_HOME=$XDG_DATA_HOME/cargo

# Editors
export EDITOR=nano
export VISUAL=code

# Pager
export PAGER=less
export LESS='-g -i -M -R -S -w -z-4'

# Locale
export LANG=en_US.UTF-8
export TIME_STYLE="long-iso"

# ZSH History
HISTORY_IGNORE='(cd(|i| *)|cl(ear|s)|code .|exit|git(| [a-z])|halt|history|?kill(| *)|l[als\.]|poweroff|ps|pwd|quit|reboot|shutdown|tmux(| *)|topgrade|tree)'
HISTFILE=$XDG_STATE_HOME/zsh_history
SAVEHIST=100000
HISTSIZE=20000

# Setup Paths
typeset -gU path fpath cdpath mailpath

path=(
  $HOME/.local/{,s}bin(N)
  $CARGO_HOME/bin
  $GOPATH/bin
  /usr/local/{,s}bin(N)
  $path
)
