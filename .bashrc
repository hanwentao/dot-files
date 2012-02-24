# .bashrc: Bash configuration file
# Wentao Han (wentao.han@gmail.com)

[ -z "$PS1" ] && return

PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
PS1="\[\e]0;\u@\h: \w\a\]$PS1"

if [ -n "$(which brew)" ]; then
    PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
    if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
        . "$(brew --prefix)/etc/bash_completion"
    fi
fi
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000
export EDITOR=$(which vim)

shopt -s histappend
shopt -s checkwinsize
set -o vi

[ -n "$(which lesspipe)" ] && eval "$(lesspipe)"
[ -n "$(which lesspipe.sh)" ] && eval "$(lesspipe.sh)"

if [ -n "$(which dircolors)" ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
