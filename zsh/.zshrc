# Source Prezto.
 if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
 fi

source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

export EDITOR=vim
export VISUAL=vim
export LANG="en_US.UTF-8"

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# User defined aliases
if [[ -s "$HOME/.aliases.sh" ]]; then
  source "$HOME/.aliases.sh"
fi

# Default to dark colorscheme - else use mother shells colorscheme
if [[ -n "$TMUX" ]]; then
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

# Key Mappings, check out:
# https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#index-widgets_002c-standard
# bindkey -e # Emacs key bindings (instead of vi)
bindkey "^[[3~" delete-char
bindkey "^R" history-incremental-search-backward
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^[F" forward-word
bindkey "^[B" backward-word

# Created by `pipx` on 2025-04-01 15:04:55
export PATH="$PATH:/Users/niet/.local/bin"
