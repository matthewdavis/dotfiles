# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source ~/.todo/todo_completion
alias t='todo.sh'

# User specific aliases and functions


export GREP_COLOR="1;33"
alias grep='grep --color=auto'
alias less='less -FiX'
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'
alias fix_elluminate='javaws -Xclearcache'

#alias irc='ssh -t shell.eng.rdu.redhat.com screen -r'
#alias irc='ssh -t log.rdu.salab.redhat.com screen -r'
alias irc='ssh log.rdu.salab.redhat.com -p 19122 -l matt'
alias centos='ssh root@172.31.1.11'

qr() {
    echo "$1" | /usr/bin/qrencode -s 10 -o - | /usr/bin/display -
}

mkmod() {
    mkdir "$1"
    mkdir "$1/files" "$1/lib" "$1/manifests" "$1/templates" "$1/tests"
}


#export PROMPT_COMMAND='PS1="\[\033[0;33m\]\!\[\033[1;30m\]|\[\033[1;34m\]\$(date +%H:%M)\[\033[1;30m\]|\`if [[ $? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`\u.\h\[\033[1;30m\]:\[\033[1;37m\]\`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\` \`if [[ "`id -u`" = "0" ]]; then echo "\\[\\033[31m\\]"; else echo "\\[\\033[32m\\]"; fi\`\\$\[\033[0;0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"'

export EDITOR="vim"
