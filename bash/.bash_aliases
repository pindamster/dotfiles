# Aliases for file listing
[[ $OSTYPE != "darwin13" ]] && alias ls='ls --color'
[[ $OSTYPE == "darwin13" ]] && alias ls='ls -G'
alias ll='ls -lh'
alias la='ll -a'

[[ -f /usr/bin/xscreensaver ]] && alias lock='xscreensaver-command -lock'

# Mounting
alias mountKlaus='sshfs klaus:/home/rniet $HOME/mounts/klaus -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=klaus'
alias mountEve='sshfs eve:/home/rniet $HOME/mounts/eve -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=eve'
alias mountLhcb='sshfs lhcb:/home/rniet $HOME/mounts/lhcb -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=lhcb'
alias mountPhiDo='sshfs phido1:/home/rniet $HOME/mounts/phido -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=phido'

[[ $OSTYPE == "darwin13" ]] && alias vim=/Applications/MacVim.app/Contents/MacOS/Vim

# Copy pwd to Mac clipboard
alias pwdc="pwd | tr -d '\n' | pbcopy"
