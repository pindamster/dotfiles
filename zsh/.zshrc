# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-tomorrow.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
export THEME_BACKGROUND="dark"

export EDITOR=vim
export VISUAL=vim

# From homebrew
export PATH="/usr/local/sbin:$PATH"

# Mounting
if [[ -s "$HOME/.aliases.sh" ]]; then
  source "$HOME/.aliases.sh"
fi

# PATH extensions
export BD2JPSIEEKSROOT=/home/rniet/storage03/repos/bd2jpsieeks/build/bin
export PATH=$BD2JPSIEEKSROOT:$PATH
export PATH="/home/rniet/anaconda/bin:$PATH"
