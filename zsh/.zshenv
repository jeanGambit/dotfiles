# Load Order:
# `.zshenv` → `.zprofile` → `.zshrc` → `.zlogin` → `.zlogout`
#
# XDG DIRECTORIES ---------------------------------------------
XDG_CONFIG_HOME=$HOME/dotfiles
XDG_DATA_HOME=$HOME/.local/share
XDG_CACHE_HOME=$HOME/.cache
XDG_STATE_HOME=$HOME/.local/state

# ZSH --------------------------------------------------------
ZDOTDIR=$XDG_CONFIG_HOME/zsh
HISTFILE=$SDOTDIR/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
#HISTORY_IGNORE="(clear|bg|fg|cd|cd -|cd ..|exit|date|w|ls|l|ll|lll)"
setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions

# Distrobox
export DISTROBOX_BACKEND=podman

# ROCm
export HSA_OVERRIDE_GFX_VERSION=10.3.0

# Rust
. "$HOME/.cargo/env"

# Python
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Pywal16
export PATH="${PATH}:${HOME}/.local/bin/"

# SDK MAN THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
