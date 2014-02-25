# Aliases for file listing
[[ $OSTYPE != "darwin13" ]] && alias ls='ls --color'
[[ $OSTYPE == "darwin13" ]] && alias ls='ls -G'
alias ll='ls -lh'
alias la='ll -a'

[[ -f /usr/bin/xscreensaver ]] && alias lock='xscreensaver-command -lock'

# Mounting
alias mountKlaus='sshfs klaus-wacker:/home/rniet /Users/rniet/Mountpoint -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=KlausWackerHome'
alias unmountKlaus='umount -f ~/Desktop/KlausWackerHome'

# Copy pwd to Mac clipboard
alias pwdc="pwd | tr -d '\n' | pbcopy"
