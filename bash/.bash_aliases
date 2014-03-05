# Aliases for file listing
[[ $OSTYPE != "darwin13" ]] && alias ls='ls --color'
[[ $OSTYPE == "darwin13" ]] && alias ls='ls -G'
alias ll='ls -lh'
alias la='ll -a'

[[ -f /usr/bin/xscreensaver ]] && alias lock='xscreensaver-command -lock'

# Mounting
alias mountKlaus='sshfs klaus:/home/rniet $HOME/mounts/klaus -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks'
alias mountEve='sshfs klaus:/home/rniet $HOME/mounts/eve -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks'
alias mountLhcb='sshfs klaus:/home/rniet $HOME/mounts/lhcb -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks'

# Copy pwd to Mac clipboard
alias pwdc="pwd | tr -d '\n' | pbcopy"
