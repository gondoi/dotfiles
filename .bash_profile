# Loaded first and will load other files (.profile .bashrc)

export PATH=/usr/local/bin:$PATH

# docker
if [ -f /usr/local/bin/docker-machine ]; then
  eval "$(docker-machine env default)"
fi

# ChefDK
export PATH=$PATH:~/.chefdk/gem/ruby/2.1.0/bin

# GO Lang
export GOPATH=$HOME/Projects/go
export PATH=$PATH:$GOPATH/bin

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
if [ -f /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  chruby ruby-2.1.3
fi

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc" # Load .bashrc

## Python
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

syspip(){
  PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

#  This _must_ be loaded last since it jacks with PATH if you don't
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=$HOME/.venvs
  . /usr/local/bin/virtualenvwrapper.sh
#  if ! workon sys; then
#    mkvirtualenv sys
#  fi
else
  echo "Python virtualenvwrapper not setup!"
fi

# Enable pyenv
eval "$(pyenv init -)"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
