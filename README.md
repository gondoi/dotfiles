# BK's dotfiles

Repo for dotfiles to ease trasition and syncing of systems.

## Setup

```
curl -Lks https://raw.githubusercontent.com/gondoi/dotfiles/master/.bin/install_config.sh | /bin/bash
```

After setup, `config` should be used in place of `git` to manage dotfiles.

Required packages after setup:

- Byobu - `apt install byobu`
- PyEnv - `curl https://pyenv.run | bash`
- hstr - https://github.com/dvorka/hstr

NOTE: Process used from [others](https://www.atlassian.com/git/tutorials/dotfiles).
