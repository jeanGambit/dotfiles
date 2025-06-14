#!/bin/bash
# ======================== #
# Init After Clean Install #
# ======================== #

# Is root?
if [[ $EUID -eq 0 ]]; then
    echo "Please run this script as a regular user, not root."
    exit 1
fi
cd
# Symlink .zshenv to read $ZDOTDIR
echo "Creating s-link for .zshenv to read \$ZDOTDIR"
ln -s $HOME/dotfiles/zsh/.zshenv .zshenv

# Install required packages
echo "Installing Zsh and plugins..."
sudo zypper refresh
sudo zypper install -y zsh zsh-autocompletion zsh-syntax-highlighting

# Set Zsh as default shell
echo "Changing default shell to Zsh..."
chsh -s $(which zsh)

# Create necessary directories
echo "Creating user directories..."
DEFAULT_DIRS=("Pictures" "Videos" "Programs" "Workspace" "Documents")
for dir in "${DEFAULT_DIRS[@]}"; do
    mkdir -p "$HOME/$dir"
done

echo "Installing Oh-My-Posh"
curl -s https://ohmyposh.dev/install.sh | bash -s

echo "Setup complete! Please restart your shell or log out and log back in."

