. "$HOME/.cargo/env"
export HISTSIZE=100000
export SAVEHIST=100000
HISTORY_IGNORE="(clear|bg|fg|cd|cd -|cd ..|exit|date|w|ls|l|ll|lll)"
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
