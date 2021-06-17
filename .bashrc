# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# added by travis gem
[ -f /Users/bkbox/.travis/travis.sh ] && source /Users/bkbox/.travis/travis.sh



# Imported from bash_profile

export PATH=/usr/local/bin:$PATH

# docker
if [ -f /usr/local/bin/docker-machine ]; then
  eval "$(docker-machine env default)"
fi

# GO Lang
export GOPATH=$HOME/Projects/go
export PATH=$PATH:$GOPATH/bin

# .local bin
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
                    PATH="$HOME/.local/bin:$PATH"
fi

# Load android tools
ANDROID="Projects/android/android-sdk-macosx"
if [ -d "$HOME/$ANDROID" ]; then
  PATH=$PATH:$HOME/$ANDROID/platform-tools:$HOME/$ANDROID/tools
fi

## Undistract me
if  [ -f /etc/profile.d/undistract-me.sh ]; then
  . /etc/profile.d/undistract-me.sh
fi

## work stuff
if [ -f ~/Dropbox/.workrc ]; then
  . ~/Dropbox/.workrc
fi

## Ruby
if [ -f /usr/local/share/chruby/chruby.sh ]; then
  source /usr/local/share/chruby/chruby.sh
  chruby ruby-2.5.1
fi

if [ -f /usr/local/share/gem_home/gem_home.sh ]; then
  source /usr/local/share/gem_home/gem_home.sh
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

## Setup direnv
if [ -x $(which direnv) ]; then
  eval "$(direnv hook bash)"
fi

## Python
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

syspip(){
  PIP_REQUIRE_VIRTUALENV="" pip3 "$@"
}

#  This _must_ be loaded last since it jacks with PATH if you don't
#if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
#  export WORKON_HOME=$HOME/.venvs
#  . /usr/local/bin/virtualenvwrapper.sh
#elif [ -f $HOME/.local/bin/virtualenvwrapper.sh ]; then
#  export WORKON_HOME=$HOME/.venvs
#  . $HOME/.local/bin/virtualenvwrapper.sh
#else
#  echo "Python virtualenvwrapper not setup!"
#fi

# Enable pyenv
#export PATH="~/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true
alias config='/usr/bin/git --git-dir=/home/gondoi/.cfg/ --work-tree=/home/gondoi'
