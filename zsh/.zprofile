# Load Order:
# .zshenv → .zprofile → .zshrc → .zlogin → .zlogout


# Start X Server which will start DWM
case "$(tty)" in
   /dev/tty2) exec startx
esac
