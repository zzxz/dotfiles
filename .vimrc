" This must be first, because it changes other options as a side effect.
set nocompatible

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Turn on line numbers.
set number

" Turn of wrapping.
set nowrap

" Set line number color to gray.
highlight LineNr ctermfg=238

" Change color of end of file ~ characters.
highlight EndOfBuffer ctermfg=232

" Highlight current line.
set cursorline
hi CursorLine cterm=none ctermbg=233

" Highlight matching brackets and parentheses in a sane way. ({})
highlight MatchParen cterm=bold ctermbg=none ctermfg=white

" Convert tabs to spaces and set width to 2.
set tabstop=2 shiftwidth=2 expandtab

set undofile                " Save undos after file closes
set undodir=$HOME/.vim/undo " Undo location (folder must exist!)

set directory^=$HOME/.vim/swp// " put swp files here

" Whitespace Destruction
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

function TrimEndLines()
  let save_cursor = getpos(".")
  :silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
endfunction

" Destroy trailing whitespace for certain filetypes.
autocmd BufWritePre <buffer> :call TrimWhitespace()
autocmd BufWritePre <buffer> :call TrimEndLines()
