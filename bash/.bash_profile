#
# LOAD ALIASES
#
[ -s ~/.bash_aliases ] && source ~/.bash_aliases

#Load git autocompletion
[ -s ~/.git-completion.bash ] && source .git-completion.bash

#Using ROOT in python
export ROOTSYS=/usr/local/Cellar/root/5.34.04
export PYTHONPATH=$ROOTSYS/lib/root
export LD_LIBRARY_PATH=$ROOTSYS/lib/root:$LD_LIBRARY_PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
# export PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}

# Setting Python Startup Var
export PYTHONSTARTUP=/Users/rniet/.pythonrc

[ -s ~/.pythonpath ] && source .pythonpath
