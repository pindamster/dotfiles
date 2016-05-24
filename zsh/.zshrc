# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export EDITOR=vim
export VISUAL=vim

# From homebrew
export PATH="/usr/local/sbin:$PATH"
alias lhcbSetup="source /lhcbsoft/LHCbSoftwareSetup.sh"

# Mounting
if [[ -s "$HOME/.aliases.sh" ]]; then
  source "$HOME/.aliases.sh"
fi
