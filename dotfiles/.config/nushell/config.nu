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

# Disable startup banner
$env.config.show_banner = false

# Env
$env.EDITOR = "nvim"
$env.TERMINAL = "kitty"
$env.BROWSER = "chromium"
$env.config.buffer_editor = "nvim"

# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
$env.XAUTHORITY = $"($env.XDG_RUNTIME_DIR)/Xauthority"
# export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtrkrc-2.0"
$env.GTK2_RC_FILES = $"($env.HOME)/.config/gtk-2.0/gtrkrc-2.0"
# export INPUTRC="$HOME/.config/inputrc"
$env.INPUTRC = $"($env.HOME)/.config/inputrc"
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
# export GNUPGHOME="$XDG_DATA_HOME/gnupg"
$env.GNUPGHOME = $"($env.XDG_DATA_HOME)/gnupg"
# export LESSHISTFILE="-"
$env.LESSHISTFILE = "-"
# export GTK_PROFILE="Arc:dark"
$env.GTK_PROFILE = "Arc:dark"
# export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
$env.GTK2_RC_FILES = $"($env.XDG_CONFIG_HOME? | default $'($env.HOME)/.config')/gtk-2.0/gtkrc-2.0"
# export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
$env.WGETRC = $"($env.XDG_CONFIG_HOME? | default $'($env.HOME)/.config')/wget/wgetrc"
# export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/X11/xinitrc"
$env.XINITRC = $"($env.XDG_CONFIG_HOME? | default $'($env.HOME)/.config')/X11/xinitrc"
#export DOCKER_BUILDKIT=1
$env.DOCKER_BUILDKIT = 1
# export PYENV_ROOT="$HOME/.pl/pyenv"
$env.PYENV_ROOT = $"($env.HOME)/.pl/pyenv"
$env.GPG_TTY = (tty)

# Path
$env.path ++= ["~/.local/bin"]
$env.path = ($env.path | split row (char esep) | prepend $"(pyenv root)/shims")
$env.path ++= [(yarn global bin)]
$env.path ++= [$"($env.HOME)/scripts"]
$env.path ++= [$"($env.PYENV_ROOT)/bin/"]

# Editors
alias vim = nvim
alias vi = nvim

# Config edit
alias ci3 = start ('~/.config/i3/config' | path expand)
alias chp = start ('~/.config/hypr/hyprland.conf' | path expand)
alias czh = start ('~/.config/zsh/.zshrc' | path expand)
alias czp = start ('~/.config/zsh/.zprofile' | path expand)
alias cki = start ('~/.config/kitty/kitty.conf' | path expand)
alias cnu = config nu
alias venv = overlay use venv/bin/activate.nu

# LS
alias l = ls
# alias ls="lsd"
# alias l="ls -l"
# alias la="ls -a"
# alias lla="ls -la"
# alias lt="ls --tree"

# X11
alias startx = startx $env.XINITRC

# git
alias chm = git checkout master
alias ga = git add
alias gs = git status
alias gdo = git diff origin/$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
alias gcp = git cherry-pick
alias gdf = git diff HEAD~1
alias gl = git log --stat
alias rbc = git rebase --continue
alias rbi = git rebase -i

# k8s
alias kl = kubectl
alias km = minikube kubectl --

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
