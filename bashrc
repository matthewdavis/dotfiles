# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#source ~/.todo/todo_completion
#export TODOTXT_DEFAULT_ACTION=ls
#alias t='todo.sh'

# User specific aliases and functions


export TERM=xterm-256color
export GREP_COLOR="1;33"
alias grep='grep --color=auto'
alias less='less -FiX'
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'

#alias irc='ssh -t shell.eng.rdu.redhat.com screen -r'
#alias irc='ssh -t log.rdu.salab.redhat.com screen -r'
#alias irc='ssh log.rdu.salab.redhat.com -p 19122 -l matt'
alias weechat='ssh -t dogpound.usersys.redhat.com tmux a'
alias centos='ssh root@172.31.1.11'
alias dp='ssh -L 6789:localhost:6789 -L 8081:localhost:8081 -L 5050:localhost:5050 -L 32400:localhost:32400 dogpound.me -l mdavis -A'
alias edge='ssh dummy@172.31.1.1'

alias ls='ls --color=auto'
alias ll='ls -l'

#alias mutt='TERM=screen-256color mutt'

qr() {
    echo "$1" | /usr/bin/qrencode -s 10 -o - | /usr/bin/display -
}

mkmod() {
    mkdir "$1"
    mkdir "$1/files" "$1/lib" "$1/manifests" "$1/templates" "$1/tests"
}


#export PROMPT_COMMAND='PS1="\[\033[0;33m\]\!\[\033[1;30m\]|\[\033[1;34m\]\$(date +%H:%M)\[\033[1;30m\]|\`if [[ $? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`\u.\h\[\033[1;30m\]:\[\033[1;37m\]\`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\` \`if [[ "`id -u`" = "0" ]]; then echo "\\[\\033[31m\\]"; else echo "\\[\\033[32m\\]"; fi\`\\$\[\033[0;0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"'
export PS1="\[\033[01;37m\]\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi) $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$\[\033[00m\] "

export EDITOR="vim"

# Path to the bash it configuration
export BASH_IT="/home/mdavis/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='nwinkler_random_colors'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source "$BASH_IT"/bash_it.sh
