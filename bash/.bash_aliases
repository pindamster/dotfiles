# Aliases for file listing
[[ $OSTYPE != "darwin14" ]] && alias ls='ls --color'
[[ $OSTYPE == "darwin14" ]] && alias ls='ls -G'
alias ll='ls -lh'
alias la='ll -a'

# Mounting
alias mountklaus='sshfs klaus:/home/rniet $HOME/mounts/klaus -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=klaus'
alias mounteve='sshfs eve:/home/rniet $HOME/mounts/eve -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=eve'
alias mountlhcb='sshfs lhcb:/home/rniet $HOME/mounts/lhcb -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=lhcb'
alias mountphido='sshfs phido1:/home/rniet $HOME/mounts/phido -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=phido'
alias mountstorage03='sshfs phido1:/net/storage03/data/users/rniet $HOME/mounts/storage03 -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=storage03'

function mountAll(){
  mountklaus
  mounteve
  mountlhcb
  mountphido
  mountstorage03
}
