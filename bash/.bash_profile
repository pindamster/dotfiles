# This is not the best way to change the shell, it "causes tons of problems"
# I use it only on linux systems where I have no root rights to
# define my shell
if [ ${OSTYPE:0:6} != "darwin" ]; then
# Test if private version of zsh exists - otherwise use system installation
  if [[ -f $HOME/software/zsh/bin/zsh-5.2 ]]; then
    export SHELL=$HOME/software/zsh/bin/zsh-5.2
    exec $HOME/software/zsh/bin/zsh-5.2
  elif [[ -f /usr/local/bin/zsh ]]; then
    export SHELL=/usr/local/bin/zsh
    exec /usr/local/bin/zsh -l
  fi
fi

# Source .bashrc
[ -f $HOME/.bashrc ] && source $HOME/.bashrc
# Define aliases
[ -s $HOME/.bash_aliases ] && source $HOME/.bash_aliases

# Default to dark colorscheme - else use mother shells colorscheme
if [[ -n $TMUX ]]; then
  export THEME_BACKGROUND="$(tmux showenv -g THEME_BACKGROUND | egrep -o "=\S+" | sed 's/=//g')"
  [[ $THEME_BACKGROUND == "dark" ]] && dark
  [[ $THEME_BACKGROUND == "light" ]] && light
fi
[[ -n $THEME_BACKGROUND ]] || dark

# If keychain prog exists run it for managing ssh-agent (This is not the OsX keychain)
# [ -s /usr/bin/keychain ] && eval $(keychain --eval --agents ssh -Q --quiet id_rsa.phido github_rsa)
# [ -s /usr/bin/keychain ] && keychain id_rsa.phido github_rsa && source $HOME/.keychain/$HOSTNAME-sh

# Using the Gnome Keyring instead...
# SSH_AUTH_SOCK=`ss -xl | grep -o '/run/user/1000/keyring-HtwLKG/ssh'`
# [ -z "$SSH_AUTH_SOCK" ] || export SSH_AUTH_SOCK

# Load git autocompletion
[ -s $HOME/.git-completion.bash ] && source $HOME/.git-completion.bash

# Load python settings
[ -s $HOME/.pythonpath ] && source $HOME/.pythonpath

# Setting Python Startup Var
# export PYTHONSTARTUP=$HOME/.pythonrc

# Define bash prompt
export PS1='[\u@\h \W]\$ '

export HISTCONTROL=ignoredups

# added by Anaconda 2.1.0 installer
export PATH="/Users/rniet/anaconda/bin:$PATH"
# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
