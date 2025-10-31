# Dotfiles
These dotfiles are made to contain most important config files across my systems. For programs, folders are structures to be managed by `GNU Stow`. However, here are other auxiliary files like fonts and icons for initial setup (i spent too much time on that, gotta stop) 

# ZSH
ZSH should be installed separatelly.

# Adding new package
0. Chose package from `.config` dir: `.config/{$package_name}` 
1. Set package name: `package_name=""`
2. Create folder structure like: `mkdir -p dotfiles/{$package_name}/.config/{$package_name}` 
3. Go to dotfile repo: `cd ~/dotfiles`
4. Register package to be managed by Stow: `stow {$package_name}`
