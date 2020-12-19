" source ~/.vim/constants.vim

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

set nu

set autoindent
colorscheme robinhood

set nocompatible
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype on
filetype plugin indent on

autocmd BufNewFile,BufReadPost *.markdown,*.mdown,*.mkd,*.mkdn,*.md set filetype=md
autocmd BufEnter * if &filetype == "" | setlocal filetype=md | endif

set shell=bash\ -l

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
" let JOURNAL_DIR = GetJournalDir()
for f in split(system('~/scripts/gather-active-vim-scripts.sh'), ' ')
  exe 'let $JOURNAL_DIR="' . $JOURNAL_DIR . '" | source' f
endfor

" :! ~/scripts/import-active-vim-scripts.sh
