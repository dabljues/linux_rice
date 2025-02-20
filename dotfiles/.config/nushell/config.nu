# config.nu
#
# Installed by:
# version = "0.102.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

# Config
## Disable startup banner
$env.config.show_banner = false
## Set buffer editor as nvim
$env.config.buffer_editor = "nvim"

# Env
## Essentials
$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
$env.TERMINAL = "kitty"
$env.BROWSER = "chromium"

## XDG
# export XDG_DATA_HOME="$HOME/.local/share"
$env.XDG_DATA_HOME = $"($env.HOME)/.local/share"
# export XDG_DATA_DIRS="/usr/local/share:/usr/share"
$env.XDG_DATA_DIRS = "/usr/local/share:/usr/share"
# export XDG_CONFIG_HOME="$HOME/.config"
$env.XDG_CONFIG_HOME = $"($env.HOME)/.config"
# export XDG_CACHE_HOME="$HOME/.cache"
$env.XDG_CACHE_HOME = $"($env.HOME)/.cache"
# export XDG_CURRENT_DESKTOP='Hyprland'
$env.XDG_CURRENT_DESKTOP = "Hyprland"

## X11
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
$env.XAUTHORITY = $"($env.XDG_RUNTIME_DIR)/Xauthority"
# export INPUTRC="$HOME/.config/inputrc"
$env.INPUTRC = $"($env.HOME)/.config/inputrc"
# export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/X11/xinitrc"
$env.XINITRC = $"($env.XDG_CONFIG_HOME? | default $'($env.HOME)/.config')/X11/xinitrc"

## GPG
# export GNUPGHOME="$XDG_DATA_HOME/gnupg"
$env.GNUPGHOME = $"($env.XDG_DATA_HOME)/gnupg"
$env.GPG_TTY = (tty)

## GTK
# export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtrkrc-2.0"
$env.GTK2_RC_FILES = $"($env.HOME)/.config/gtk-2.0/gtrkrc-2.0"
# export GTK_PROFILE="Arc:dark"
$env.GTK_PROFILE = "Arc:dark"
# export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
$env.GTK2_RC_FILES = $"($env.XDG_CONFIG_HOME? | default $'($env.HOME)/.config')/gtk-2.0/gtkrc-2.0"

## Python
# export PYENV_ROOT="$HOME/.pl/pyenv"
$env.PYENV_ROOT = $"($env.HOME)/.pl/pyenv"

## Other
# export LESSHISTFILE="-"
$env.LESSHISTFILE = "-"
# export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
$env.WGETRC = $"($env.XDG_CONFIG_HOME? | default $'($env.HOME)/.config')/wget/wgetrc"
#export DOCKER_BUILDKIT=1
$env.DOCKER_BUILDKIT = 1

## Starship
$env.STARSHIP_CONFIG = $"($env.HOME)/.config/starship/starship.toml"

# Path
$env.path ++= ["~/.local/bin"]
$env.path = ($env.path | split row (char esep) | prepend $"(pyenv root)/shims")
$env.path ++= [(yarn global bin)]
$env.path ++= [$"($env.HOME)/scripts"]
$env.path ++= [$"($env.PYENV_ROOT)/bin/"]

# Editors
alias vim = nvim
alias vi = nvim

# Misc
alias cat = bat

# Config edit
alias ci3 = nu -c $"($env.EDITOR) ('~/.config/i3/config' | path expand)"
alias chp = nu -c $"($env.EDITOR) ('~/.config/hypr/hyprland.conf' | path expand)"
alias czh = nu -c $"($env.EDITOR) ('~/.config/zsh/.zshrc' | path expand)"
alias czp = nu -c $"($env.EDITOR) ('~/.config/zsh/.zprofile' | path expand)"
alias cki = nu -c $"($env.EDITOR) ('~/.config/kitty/kitty.conf' | path expand)"
alias cnu = config nu

# Python
alias venv = overlay use venv/bin/activate.nu

# ls
alias l = ls

# X11
alias startx = startx $env.XINITRC

# git
alias chm = git checkout master
alias ga = git add
alias gd = git diff
alias gs = git status
alias gc = git commit
alias gau = git add -u
alias gdo = git diff origin/$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
alias gco = git checkout
alias gcp = git cherry-pick
alias gdf = git diff HEAD~1
alias gl = git log --stat
alias rbc = git rebase --continue
alias rbi = git rebase -i

# k8s
alias kl = kubectl
alias km = minikube kubectl --

# starship
$env.STARSHIP_SHELL = "nu"

# Direnv
$env.config = {
  hooks: {
    pre_prompt: [{ ||
      if (which direnv | is-empty) {
        return
      }

      direnv export json | from json | default {} | load-env
      if 'ENV_CONVERSIONS' in $env and 'PATH' in $env.ENV_CONVERSIONS {
        $env.PATH = do $env.ENV_CONVERSIONS.PATH.from_string $env.PATH
      }
    }]
  }
}

# Work stuff
const work_file_path = "~/.config/nushell/work.nu"
source (if ($work_file_path | path expand | path exists) {
  $work_file_path | path expand
})
