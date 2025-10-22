# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History settings
HISTSIZE=50000
HISTFILESIZE=100000
HISTCONTROL=ignoreboth:erasedups  # ignore duplicates and commands starting with space
HISTIGNORE='ls:ll:cd:pwd:bg:fg:history'
shopt -s histappend               # append to history, don't overwrite
shopt -s cmdhist                  # save multi-line commands as one entry

# Useful shell options
shopt -s checkwinsize             # update LINES and COLUMNS after each command
shopt -s cdspell                  # autocorrect minor spelling errors in cd
shopt -s dirspell                 # autocorrect directory names during completion
shopt -s autocd                   # cd by just typing directory name

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


alias ip='ip -c'
alias ..='cd ..'
alias grep='grep --color=auto'
alias less='less -FiX'
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'
alias ls='lsd -F --color=auto --group-dirs first'
alias ll='lsd -lia --color=auto --git --group-dirs first'
alias server='ssh root@172.31.1.11'
alias dp='ssh -L 6789:localhost:6789 -L 8081:localhost:8081 -L 5050:localhost:5050 -L 32400:localhost:32400 dogpound.me -l mdavis -A'
alias mkdir='mkdir -pv'
alias free='free -mt'
alias ps='ps auxf'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
alias wget='wget -c'
alias histg='history | grep'
alias myip='curl ipv4.icanhazip.com'
alias cat=bat
alias rm='rm -I'                  # prompt if deleting more than 3 files
alias mv='mv -i'                  # interactive mode (prompt before overwrite)
alias cp='cp -i'                  # interactive mode

qr() {
    echo "$1" | /usr/bin/qrencode -s 10 -o - | /usr/bin/display -
}

# Extract any archive
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2) tar xjf "$1" ;;
            *.tar.gz)  tar xzf "$1" ;;
            *.bz2)     bunzip2 "$1" ;;
            *.gz)      gunzip "$1" ;;
            *.tar)     tar xf "$1" ;;
            *.zip)     unzip "$1" ;;
            *.7z)      7z x "$1" ;;
            *) echo "'$1' cannot be extracted" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Quick directory creation and navigation
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Git-aware prompt
parse_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Set prompt
PS1="${Yellow}\u@\h${NC}: ${Blue}\w ${Purple}\$(parse_git_branch)${NC}\\$ "

export EDITOR="vim"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# Clean up orphaned ssh-agent processes
clean-ssh-agents() {
    pkill -u "$USER" ssh-agent
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
    source "$XDG_RUNTIME_DIR/ssh-agent.env"
    echo "SSH agents cleaned and restarted"
}



# arch specific alias'
# requires rate-mirrors-bin pacman-contrib pacutils
# yay -S rate-mirros-bin pacman-contrib

alias ua-drop-caches='sudo paccache -rk3; yay -Sc --aur --noconfirm'
alias ua-update-all='export TMPFILE="$(mktemp)"; \
    sudo true; \
    rate-mirrors --save=$TMPFILE arch --max-delay=21600 \
      && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
      && sudo mv $TMPFILE /etc/pacman.d/mirrorlist \
      && ua-drop-caches \
      && yay -Syyu --noconfirm'

