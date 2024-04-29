# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#Source Prezto.
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

if [[ -s "$HOME/.pythonpath" ]]; then
  source "$HOME/.pythonpath" ]]
fi

# Default to dark colorscheme - else use mother shells colorscheme
if [[ -n $TMUX ]]; then
  export THEME_BACKGROUND="$(tmux showenv -g THEME_BACKGROUND | egrep -o "=\S+" | sed 's/=//g')"
  [[ $THEME_BACKGROUND == "dark" ]] && dark
  [[ $THEME_BACKGROUND == "light" ]] && light
fi
[[ -n $THEME_BACKGROUND ]] || dark

if [ -n "$TMUX" ]; then                                                                               
  function refresh {                                                                                
    export $(tmux show-environment | grep "^SSH_AUTH_SOCK")                                       
    export $(tmux show-environment | grep "^DISPLAY")                                             
    export $(tmux show-environment | grep "^THEME_BACKGROUND")
  }                                                                                                 
else                                                                                                  
  function refresh { }                                                                              
fi
function preexec {
  refresh
}
bindkey "^[[3~" delete-char
bindkey "^R" history-incremental-search-backward

export LANG="en_US.UTF-8"

bindkey -e
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
