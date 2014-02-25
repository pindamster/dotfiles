# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Define aliases
[ -s $HOME/.bash_aliases ] && source $HOME/.bash_aliases

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin 
