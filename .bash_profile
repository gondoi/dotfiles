# Loaded first and will load other files (.profile .bashrc)

export PATH=/usr/local/bin:$PATH

# GO Lang
export GOPATH=~/.gocode
export PATH=$PATH:~/.gocode/bin

# Load android tools
ANDROID="Projects/android/adt-bundle-mac-x86_64-20131030/sdk"
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
  chruby ruby-2.1.0
fi

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc" # Load .bashrc

## Python
# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

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
