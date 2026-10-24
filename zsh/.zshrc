# Ensure the cache and completion directories exist and are in fpath
mkdir -p "$ZSH_CACHE_DIR/completions"
(( ${fpath[(Ie)"$ZSH_CACHE_DIR/completions"]} )) || fpath=("$ZSH_CACHE_DIR/completions" $fpath)

# ---- Load antidote ----
source ~/.antidote/antidote.zsh
antidote load

# Source .zshrc.d.
for _rc in $HOME/dotfiles/zsh/.zshrc.d/**/*.zsh; do
  # Ignore tilde files.
  if [[ $_rc:t != '~'* ]]; then
    source "$_rc"
  fi
done
unset _rc

# Use Emacs-style command-line editing. This is the default but is overriden by zsh because $EDITOR AND $VISUAL are set to nvim in .zshenv
bindkey -e

# Starship
eval "$(starship init zsh)"

# Vite+ bin (https://viteplus.dev)
VITE_PLUS_ENV_PATH="$HOME/.config/vite-plus/env"
if [[ -a "$VITE_PLUS_ENV_PATH" ]]; then
  . "$VITE_PLUS_ENV_PATH"
fi
