# Load Order
`.zshenv` → `.zprofile` → `.zshrc` → `.zlogin` → `.zlogout`
# Installation
Follow these steps to install all necessary packages, fonts, configs, etc.
```bash
sudo zypper in zsh   # install
chsh -s $(which zsh) # change from bash to zsh
```
**then logout**
```bash
mkdir $XDG_CONFIG_HOME
```
## Script #1
```bash
# Ensure the script is run as a regular user
if [[ $EUID -eq 0 ]]; then
    echo "Please run this script as a regular user, not root."
    exit 1
fi
echo "Updating system"
sudo zypper ref && zypper dup
echo "Installing ZSH"
sudo zypper in zsh
# Check if ssh key exist
[ -f ~/.ssh/git/key] || { echo "Github ssh key does not exist, aborting."; exit 1; }
# Clone dotfiles
cd
git clone git@github.com:jeanGambit/dotfiles.git
# Symlink .zshenv to read $ZDOTDIR
echo "Creating symlink for .zshenv to read \$ZDOTDIR"
ln -s $HOME/dotfiles/zsh/.zshenv .zshenv
# Install required packages
source .zshenv
echo "Installing Zsh and plugins..."
sudo zypper refresh
sudo zypper install -y zsh # zsh-autocompletion zsh-syntax-highlighting
# install zinit - zsh plugin manager
# git clone https://github.com/zdharma-continuum/zinit.git "${XDG_CONFIG_HOME:-$HOME/.config}/zinit"
sh -c "$(curl -fsSL https://git.io/zinit-install)"

# Set Zsh as default shell
echo "Changing default shell to Zsh..."
chsh -s $(which zsh)

# Create necessary directories
echo "Creating user directories..."
DEFAULT_DIRS=("Pictures" "Videos" "Programs" "Workspace" "Documents" "Books")
for dir in "${DEFAULT_DIRS[@]}"; do
    mkdir -p "$HOME/$dir"
done

echo "Installing Oh-My-Posh"
curl -s https://ohmyposh.dev/install.sh | bash -s # mb need to set PATH==$PATH:/home/maker-test/.local/bin

echo "Setup complete! Please restart your shell or log out and log back in."
```

## Script 2
```bash
echo "Setup configs with dotfiles and stow"
sudo zypper in stow -y
cd dotfiles
stow nvim
stow wezterm
stow rofi
stow mako
stow niri
stow 
```
## Script 3
```bash
echo "Installing system packages"
sudo zypper in -y \
pipewire \ 
mako \
yazi \
rofi
```
## Script 4
```bash
echo "Installing CLI packages"
sudo zypper in \
stow \
bat \
z \
fzf \
btop \
lazygit \
ripgrep \
tldr \
yazi \
lsd \
exa \
nvim \
```

```
required programs:
oh-my-posh

# DWM
gcc
libX11-devel
libXft-devel
libXinerama-devel

# Stow configs
stow

# X Server
xorg-x11-server
# xorg-x11 - not sure
xinit

sudo zypper in gcc libX11-devel libXft-devel libXinerama-devel stow


```

```
# Load Zinit
source "${HOME}/.zinit/bin/zinit.zsh"

# Autosuggestions
zinit light zsh-users/zsh-autosuggestions

# fzf-tab (fuzzy tab completion)
zinit light Aloxaf/fzf-tab

# Fast Syntax Highlighting (must be last!)
zinit light zdharma-continuum/fast-syntax-highlighting

# Enable vi-mode
bindkey -v
export KEYTIMEOUT=1

# Optional: show vi-mode in prompt
function zle-keymap-select {
  case $KEYMAP in
    vicmd) RPROMPT="%F{yellow}[NORMAL]%f" ;;
    main|viins) RPROMPT="" ;;
  esac
  zle reset-prompt
}
zle -N zle-keymap-select

# fzf-tab customization
zstyle ':fzf-tab:*' show-group 'yes'
zstyle ':fzf-tab:*' switch-group 'Shift-Tab'
zstyle ':fzf-tab:*' fzf-flags '--ansi --preview-window=right:50%'

# Autosuggestions color (optional)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Fast Syntax Highlighting style (optional)
FAST_HIGHLIGHT_STYLES[comment]='fg=blue'
FAST_HIGHLIGHT_STYLES[command]='fg=green'

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt share_history

# Completion system
autoload -Uz compinit
compinit
```
