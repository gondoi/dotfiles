# BK's dotfiles

Repo for dotfiles to ease trasition and syncing of systems.

## Setup

```
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

After setup, `config` should be used in place of `git` to manage dotfiles.

First init:
```
echo ".cfg" >> .gitignore
git clone --bare <git-repo-url> $HOME/.cfg
config checkout
```

This will likely fail and files in place should be removed or backed up.

```
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
config checkout
config config --local status.showUntrackedFiles no
```

NOTE: Process used from [others](https://www.atlassian.com/git/tutorials/dotfiles).
