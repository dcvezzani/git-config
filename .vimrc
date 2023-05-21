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
:command! Fname :r!echo -n "%:p" | pbcopy

" current filename without the extension
:command! FnameNoExt :r!echo -n "%:t:r" | pbcopy

" current filename with the extension
:command! FnameExt :r!echo -n "%:t" | pbcopy

" load scripts from ~/scripts
" exclude .vim files whose filename starts with 'x'
" or move scripts to a different location so they are not pulled in
" let JOURNAL_DIR = GetJournalDir()
for f in split(system('~/scripts/gather-active-vim-scripts.sh'), ' ')
  " echo 'loading: '.f
  exe 'let $JOURNAL_DIR="' . $JOURNAL_DIR . '" | source' f
  " exe 'let $JOURNAL_DIR="/Users/dcvezzani/Dropbox/journal" | source' f
  " let $JOURNAL_DIR="/Users/dcvezzani/Dropbox/journal" | source /Users/dcvezzani/scripts/file_management.vim
  " 
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

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

" and a handy-dandy function to toggle a Netrw sidebar
" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>
