# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Make colorcoding available for everyone

Black='\[\e[0;30m\]'    # Black
Red='\[\e[0;31m\]'              # Red
Green='\[\e[0;32m\]'    # Green
Yellow='\[\e[0;33m\]'   # Yellow
Blue='\[\e[0;34m\]'             # Blue
Purple='\[\e[0;35m\]'   # Purple
Cyan='\[\e[0;36m\]'             # Cyan
White='\[\e[0;37m\]'    # White

# Bold
BBlack='\[\e[1;30m\]'   # Black
BRed='\[\e[1;31m\]'             # Red
BGreen='\[\e[1;32m\]'   # Green
BYellow='\[\e[1;33m\]'  # Yellow
BBlue='\[\e[1;34m\]'    # Blue
BPurple='\[\e[1;35m\]'  # Purple
BCyan='\[\e[1;36m\]'    # Cyan
BWhite='\[\e[1;37m\]'   # White

# Background
On_Black='\[\e[40m\]'   # Black
On_Red='\[\e[41m\]'             # Red
On_Green='\[\e[42m\]'   # Green
On_Yellow='\[\e[43m\]'  # Yellow
On_Blue='\[\e[44m\]'    # Blue
On_Purple='\[\e[45m\]'  # Purple
On_Cyan='\[\e[46m\]'    # Cyan
On_White='\[\e[47m\]'   # White

NC='\[\e[m\]'                   # Color Reset

ALERT="${BWhite}${On_Red}" # Bold White on red background

# User specific aliases and functions


alias ..='cd ..'
alias grep='grep --color=auto'
alias less='less -FiX'
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'
alias ls='ls -CF --color=auto'
alias ll='ls -lisa --color=auto'
alias server='ssh root@172.31.1.11'
alias dp='ssh -L 6789:localhost:6789 -L 8081:localhost:8081 -L 5050:localhost:5050 -L 32400:localhost:32400 dogpound.me -l mdavis -A'
alias mkdir='mkdir -pv'
alias free='free -mt'
alias ps='ps auxf'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
alias wget='wget -c'
alias histg='history | grep'
alias myip='curl ipv4.icanhazip.com'


qr() {
    echo "$1" | /usr/bin/qrencode -s 10 -o - | /usr/bin/display -
}

#export PROMPT_COMMAND='PS1="\[\033[0;33m\]\!\[\033[1;30m\]|\[\033[1;34m\]\$(date +%H:%M)\[\033[1;30m\]|\`if [[ $? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`\u.\h\[\033[1;30m\]:\[\033[1;37m\]\`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\` \`if [[ "`id -u`" = "0" ]]; then echo "\\[\\033[31m\\]"; else echo "\\[\\033[32m\\]"; fi\`\\$\[\033[0;0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"'
#export PS1="\[\033[01;37m\]\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi) $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;32m\]\u@\h'; fi)\[\033[01;34m\] \w \$\[\033[00m\] "
# Set prompt
PS1="${Yellow}\u@\h${NC}: ${Blue}\w${NC} \\$ "

export EDITOR="vim"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

