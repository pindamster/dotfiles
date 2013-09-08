# Aliases for file listing
alias ls='ls -G'
alias ll='ls -lh'
alias la='ll -a'

# Mounting
alias mountKlaus='sshfs klaus-wacker:/home/rniet /Users/rniet/Mountpoint -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=KlausWackerHome'
alias unmountKlaus='umount -f ~/Desktop/KlausWackerHome'

# Copy pwd to Mac clipboard
alias pwdc="pwd | tr -d '\n' | pbcopy"
