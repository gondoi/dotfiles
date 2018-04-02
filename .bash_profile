# Loaded first and will load other files (.profile .bashrc)
[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc" # Load .bashrc
_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true
