# .bashrc: Bash configuration file
# Wentao Han (wentao.han@gmail.com)

# XXX: Fix TERM variable to support 256-color mode for GNOME Terminal
if [ "$COLORTERM" == "gnome-terminal" ]; then
    export TERM="xterm-256color"
fi

[ -z "$PS1" ] && return

_update_ps1() {
    # prompt, in red if an error occurred in last command
    if [ $? -eq 0 ]; then
        PROMPT='\$'
    else
        PROMPT='\[\e[1;31m\]\$\[\e[0m\]'
    fi
    # username@hostname in green
    USER_HOST_NAMES='\[\e[1;32m\]\u@\h\[\e[0m\]'
    # relative current working directory in blue
    WORKING_DIR='\[\e[1;34m\]\w\[\e[0m\]'
    # title in terminal emulator
    if [ "$TERM" != "linux" ]; then
        TERM_TITLE='\[\e]0;\u@\h: \w\a\]'
    else
        TERM_TITLE=''
    fi
    # finally, combine them all
    PS1="$TERM_TITLE$USER_HOST_NAMES:$WORKING_DIR$PROMPT "
}

export PROMPT_COMMAND="_update_ps1"

if [ -f "/etc/bash_completion" ] && ! shopt -oq posix; then
    . "/etc/bash_completion"
fi
if [ -n "$(which brew 2>/dev/null)" ]; then
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
export EDITOR=$(which vim 2>/dev/null)

shopt -s histappend
shopt -s checkwinsize
set -o vi

[ -n "$(which lesspipe 2>/dev/null)" ] && eval "$(lesspipe)"
[ -n "$(which lesspipe.sh 2>/dev/null)" ] && eval "$(lesspipe.sh)"

if [ -n "$(which dircolors 2>/dev/null)" ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
