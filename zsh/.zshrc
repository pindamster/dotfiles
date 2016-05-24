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
alias mountklaus='sshfs klaus:/home/rniet $HOME/mounts/klaus -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=klaus'
alias mounteve='sshfs eve:/home/rniet $HOME/mounts/eve -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=eve'
alias mountbam='sshfs bam:/home/rniet $HOME/mounts/bam -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=bam'
alias mountlhcb='sshfs lhcb:/home/rniet $HOME/mounts/lhcb -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=lhcb'
alias mountphido='sshfs phido1:/home/rniet $HOME/mounts/phido -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=phido'
alias mountstorage03='sshfs eve:/net/storage03/data/users/rniet $HOME/mounts/storage03 -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=storage03'
