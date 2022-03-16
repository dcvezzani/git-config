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
  " echo 'loading: '.f
  exe 'let $JOURNAL_DIR="' . $JOURNAL_DIR . '" | source' f
endfor

" :! ~/scripts/import-active-vim-scripts.sh

" format XML
com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
nnoremap = :FormatXML<Cr>

" livedown.vim configuration
" nmap gm :LivedownToggle<CR>

" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0

" should the browser window pop-up upon previewing
let g:livedown_open = 1

" the port on which Livedown server will run
let g:livedown_port = 1337

" the browser to use, can also be firefox, chrome or other, depending on your executable
" let g:livedown_browser = "safari"

