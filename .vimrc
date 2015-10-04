set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

set autoindent
colorscheme robinhood

set nocompatible
execute pathogen#infect()
syntax on
filetype plugin indent on

au BufNewFile,BufRead *.md set ft=md
nmap gm :LivedownToggle<CR>

" current filename without the extension
:command! Fname :r!echo "%:p" | pbcopy

" current filename without the extension
:command! FnameNoExt :r!echo "%:t:r" | pbcopy

" current filename with the extension
:command! FnameExt :r!echo "%:t" | pbcopy

" load scripts from ~/scripts
" exclude .vim files whose filename starts with 'x'
" or move scripts to a different location so they are not pulled in
for f in split(system('~/scripts/gather-active-vim-scripts.sh'), ' ')
  exe 'source' f
endfor
