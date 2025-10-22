# Load Order:
# [.zshenv] → .zprofile → .zshrc → .zlogin → .zlogout
#
# XDG DIRECTORIES ---------------------------------------------
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export XDG_STATE_HOME=$HOME/.local/state

export DOTFILES=$HOME/dotfiles
# ZSH --------------------------------------------------------
export ZDOTDIR=$DOTFILES/zsh
export HISTFILE=$ZDOTDIR/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
HISTORY_IGNORE="(clear|bg|fg|cd|cd -|cd ..|exit|date|w|ls|l|ll|lll)"
setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions
setopt CORRECT
