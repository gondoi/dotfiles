" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin on
filetype indent on
syntax on

set background=dark
set expandtab
autocmd Filetype gitcommit setlocal spell textwidth=72
set list
set listchars=tab:·\ ,trail:·
set ruler
