# System Fonts
```
cp  ~/dotfiles/fonts/* /usr/share/fonts/
```
# User Fonts
```
mkdir ~/.local/share/fonts
sudo cp -r  ~/dotfiles/fonts/* ~/.local/share/fonts
```
# Refresh cash
```
fc-cache -f -v
```
