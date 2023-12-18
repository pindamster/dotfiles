echo "LOADING BASH_ALIASES"
# User defined aliases (common to zsh)
if [[ -s "$HOME/.aliases.sh" ]]; then
  source "$HOME/.aliases.sh"
fi

