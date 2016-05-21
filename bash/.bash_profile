export SHELL=/usr/local/bin/zsh
exec /usr/local/bin/zsh -l

set -o vi
# Source .bashrc
[ -f $HOME/.bashrc ] && source $HOME/.bashrc
# Define aliases
[ -s $HOME/.bash_aliases ] && source $HOME/.bash_aliases

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

# Using ROOT in python
# export ROOTSYS=/usr/local/Cellar/root/5.34.04
# export PYTHONPATH=$ROOTSYS/lib/root
# export LD_LIBRARY_PATH=$ROOTSYS/lib/root:$LD_LIBRARY_PATH

# Setting Python Startup Var
# export PYTHONSTARTUP=$HOME/.pythonrc

# Define bash prompt
export PS1='[\u@\h \W]\$ '

export TUPLESROOT='/fhgfs/groups/e5/lhcb/NTuples/B2CC/Bd2JpsiKS/Jpsi2ee/'
export TUPLESROOT_MC='/fhgfs/groups/e5/lhcb/NTuples/B2CC/Bd2JpsiKS/Jpsi2ee/MC/Sim08f/2011+2012/'
export TUPLESROOT_DATA='/fhgfs/groups/e5/lhcb/NTuples/B2CC/Bd2JpsiKS/Jpsi2ee/Data/combined/'

export HISTCONTROL=ignoredups

# added by Anaconda 2.1.0 installer
export PATH="/Users/rniet/anaconda/bin:$PATH"
