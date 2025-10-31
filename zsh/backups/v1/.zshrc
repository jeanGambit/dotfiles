# Vi mode
#bindkey -v

#function zle-keymap-select {
#   if [[ $KEYMAP == vicmd ]]; then
#     echo -ne "\e[1 q"  # change cursor to block
#   else
#     echo -ne "\e[5 q"  # change cursor to beam
#   fi
# }
# zle -N zle-keymap-select
# zle -N zle-line-init
# zle-line-init() { zle-keymap-select }

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Load modules
autoload -U colors && colors
autoload -Uz tetriscurses
# Plugins:
## Fuzzy Finder (zypper)
source <(fzf --zsh)
## Auto Suggestions (local)
source ~/.dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
## Syntax Highlight
source /home/gambit/.dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Oh My Posh
eval "$(oh-my-posh init zsh --config /home/gambit/dotfiles/oh-my-posh/theme_config.toml)"

# X11
# DWM
alias dwm_start="startx ~/.config/chadwm/scripts/run.sh"

# KDE
alias kde_logout="qdbus org.kde.ksmserver /KSMServer logout 0 0 1"

# Distrobox
export DISTROBOX_BACKEND=podman

# ROCm
export HSA_OVERRIDE_GFX_VERSION=10.3.0

# Python
. "$HOME/.cargo/env"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Pywal16
export PATH="${PATH}:${HOME}/.local/bin/"

# Floorp
# export PATH="$PATH:/path/to/floorp"

# Steam - to work in nested X11 server
export DISPLAY=:1

# SDK MAN THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
