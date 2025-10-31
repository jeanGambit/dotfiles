# Load Order:
# .zshenv → .zprofile → .zshrc → .zlogin → .zlogout
# Add here programs init, config and setup
source .zshalias
# Zsh Plugins ============================================================================
## TETRTIS 
autoload -Uz tetriscurses
## Fuzzy Finder (zypper)
source <(fzf --zsh)
## Auto Suggestions (local)
source $ZDOTDIR/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
## Syntax Highlight
source $ZDOTDIR/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Oh My Posh =========================================================================
eval "$(oh-my-posh init zsh --config $XDG_CONFIG_HOME/oh-my-posh/theme_config.toml)"

