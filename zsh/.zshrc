# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export EDITOR=vim
export VISUAL=vim

# From homebrew
export PATH="/usr/local/sbin:$PATH"

# User defined aliases
if [[ -s "$HOME/.aliases.sh" ]]; then
  source "$HOME/.aliases.sh"
fi

# Default to dark colorscheme - else use mother shells colorscheme
if [[ -n $TMUX ]]; then
  export THEME_BACKGROUND="$(tmux showenv -g THEME_BACKGROUND | egrep -o "=\S+" | sed 's/=//g')"
  [[ $THEME_BACKGROUND == "dark" ]] && dark
  [[ $THEME_BACKGROUND == "light" ]] && light
fi
[[ -n $THEME_BACKGROUND ]] || dark

# PATH extensions
export BD2JPSIEEKSROOT=/home/rniet/storage03/repos/bd2jpsieeks/build/bin
export PATH=$BD2JPSIEEKSROOT:$PATH
export PATH="/home/rniet/anaconda/bin:$PATH"
