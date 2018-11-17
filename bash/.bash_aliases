# User defined aliases (common to zsh)
if [[ -s "$HOME/.aliases.sh" ]]; then
  source "$HOME/.aliases.sh"
fi

# Aliases for file listing (when using bash)
[[ $OSTYPE != "darwin17" ]] && alias ls='ls --color'
[[ $OSTYPE == "darwin17" ]] && alias ls='ls -G'
alias ll='ls -lh'
alias la='ll -a'
