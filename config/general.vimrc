" yanks copy to the clipboard
set clipboard+=unnamed

" turn off line wrapping
set nowrap

" show matching brackets
set showmatch 

" turns off error noises
set noerrorbells

" hides the mouse while typing
set mousehide

" line numbering
set number

" allow multiple buffers with changes
set hidden

" don't both trying to be compatible with Vi
set nocompatible

" tabs as spaces settings
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2
set smarttab
set shiftround

" backspace should always work!
set backspace=indent,eol,start

" display row/column in status
set ruler

" search as you type
set incsearch

" make yank work from the cursor to line end
nnoremap Y y$

