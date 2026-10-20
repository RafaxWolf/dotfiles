# ~/.bashrc

# Interactive shells only.
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
shopt -s histappend checkwinsize
HISTSIZE=1000
HISTFILESIZE=2000

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Two-line prompt inspired by Kali Linux.
PS1='\[\033[01;34m\]┌──(\[\033[01;32m\]\u㉿\h\[\033[01;34m\])-[\[\033[01;37m\]\w\[\033[01;34m\]]\n└─\[\033[01;32m\]\$\[\033[00m\] '
case "$TERM" in
    xterm*|rxvt*) PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1" ;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='lsd --group-dirs=first'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ll='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias cat='batcat --color=always'
alias cls='clear'

alias alert='notify-send --urgency=low -i "$( [ $? = 0 ] && echo terminal || echo error )" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# Command-line highlighting is provided by ble.sh when installed.
if [ -r "$HOME/.local/share/blesh/ble.sh" ]; then
    source -- "$HOME/.local/share/blesh/ble.sh"
fi
