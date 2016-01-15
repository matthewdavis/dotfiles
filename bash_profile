# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:/home/mdavis/keepass/usr/local/bin:$HOME/.todo:$HOME/.local/bin

export PATH
export HISTFILESIZE=10000
export HISTSIZE=10000
