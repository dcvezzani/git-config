set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

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

function! CdToIt()
  let bounds = MdSelectTerm('[:space:]\"'."'", 'true')
  let strParts = MdSplitOnBounds(getline('.'), bounds[0], bounds[1])
  let strTerm = strParts[1]

  exe 'cd' strTerm
  "let @z = '' | normal @z
  "echo 'cd' strTerm
endfunction

function! OpenIt()
  let bounds = MdSelectTerm('[:space:]\"'."'", 'false')
  let strParts = MdSplitOnBounds(getline('.'), bounds[0], bounds[1])
  let strTerm = strParts[1]

  let termColon = stridx(strTerm, ":")
  let cmd_args = ''

  if( termColon > -1 )
    let file_resource = strpart(strTerm, 0, termColon)
    let line_number = strpart(strTerm, (termColon+1))
    let cmd_args = file_resource . ' ' . line_number

  else
    let bufPattern = '^[^\"]*\"\([^\"]*\)\"[[:space:]]*line \([0-9][0-9]*\).*$'
    let file_resource = strTerm
    let line_number = substitute(getline("."), bufPattern, '\2', "")
    let @z = line_number

    if(strlen(line_number) > 0)
      let cmd_args = file_resource . ' ' . line_number

    else
      let cmd_args = strTerm
    endif
  endif

  silent execute "!~/scripts/iterm-open.sh " . cmd_args
  
  "let @z = '' | normal @z
  "echo strParts[1]
endfunction

nmap gX :call OpenIt()<CR>
nmap cd :call CdToIt()<CR>
