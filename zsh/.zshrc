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

# Theme handling removed - using terminal default colors

if [ -n "$TMUX" ]; then                                                                               
  function refresh {                                                                                
    local ssh_auth=$(tmux show-environment | grep "^SSH_AUTH_SOCK" 2>/dev/null)
    local display=$(tmux show-environment | grep "^DISPLAY" 2>/dev/null)
    local theme=$(tmux show-environment | grep "^THEME_BACKGROUND" 2>/dev/null)
    
    [[ -n "$ssh_auth" ]] && export $ssh_auth
    [[ -n "$display" ]] && export $display
    [[ -n "$theme" ]] && export $theme
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

# Working Log Functions
WORKING_LOGS_DIR="/Users/rniet/Library/CloudStorage/OneDrive-congstar/working_logs"

function wlog() {
    local today_file="$WORKING_LOGS_DIR/today.md"
    local template_file="$WORKING_LOGS_DIR/template.md"
    
    if [[ ! -f "$today_file" ]]; then
        if [[ ! -f "$template_file" ]]; then
            echo "Error: Template file not found at $template_file"
            return 1
        fi
        
        # Copy template and update date
        local today_date=$(date +"%Y-%m-%d")
        sed "s/# 2025-07-31/# $today_date/" "$template_file" > "$today_file"
        echo "Created today's log from template"
    fi
    
    tmux new-session -s "worklog" "vim '$today_file'" 2>/dev/null || tmux attach -t "worklog"
}

function wfin() {
    local today_file="$WORKING_LOGS_DIR/today.md"
    
    if [[ ! -f "$today_file" ]]; then
        echo "Error: No today.md file found to finalize"
        return 1
    fi
    
    # Extract date from file header (first line should be "# YYYY-MM-DD")
    local file_date=$(head -1 "$today_file" | grep -o '[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}')
    
    # Fallback to today's date if extraction fails
    if [[ -z "$file_date" ]]; then
        echo "Warning: Could not extract date from file header, using today's date"
        file_date=$(date +"%Y-%m-%d")
    fi
    
    local final_file="$WORKING_LOGS_DIR/$file_date.md"
    
    # Handle file conflicts by appending version number
    local version=1
    local target_file="$final_file"
    
    while [[ -f "$target_file" ]]; do
        target_file="$WORKING_LOGS_DIR/${file_date}_${version}.md"
        ((version++))
    done
    
    # Move the file
    mv "$today_file" "$target_file"
    
    # Kill the tmux session to prevent stale vim session
    tmux kill-session -t "worklog" 2>/dev/null
    
    echo "Log finalized as $target_file"
}
