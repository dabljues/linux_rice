#!/bin/zsh

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"

export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="chromium"

# ~/ Clean-up:
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtrkrc-2.0"
export INPUTRC="$HOME/.config/inputrc"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
# ZSH
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export ZSH="/home/$USER/.config/oh-my-zsh"
export HISTFILE="$ZDOTDIR"/history
export ZSH_CUSTOM=$ZSH/custom
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/X11/xinitrc"
export GTK_PROFILE="Arc:dark"

eval $(dircolors "$XDG_CONFIG_HOME"/dircolors)

# Scripts

export PATH="$PATH:$HOME/scripts"

# pyenv

export PYENV_ROOT="$HOME/.pl/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# Docker
export DOCKER_BUILDKIT=1
