export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add RVM to PATH for scripting
export PATH=$PATH:$HOME/.rvm/bin 
export BOOST_ROOT=/cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_68/Boost/1.55.0_python2.7/x86_64-slc6-gcc48-opt
export CPTOYMCSYS=/home/rniet/storage03/software/cptoymc
export EDITOR=vim
export BD2JPSIEEKSROOT=/home/rniet/storage03/repos/bd2jpsieeks/build/bin
export PATH=$PATH:$BD2JPSIEEKSROOT

# added by Anaconda 2.2.0 installer
export PATH="/home/rniet/anaconda/bin:$PATH"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
