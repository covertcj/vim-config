" Load vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

" Sensible.vim
Bundle 'tpope/vim-sensible'
runtime! plugin/sensible.vim

set nocompatible "must be the first line
filetype off

" leader button setup
let mapleader = ","
set timeoutlen=2500

" tab settings
"set expandtab
"set tabstop=4
"set shiftwidth=4

" syntax highlighting
syntax on

" allow backspacing anywhere
set backspace=2

" turn off annoying error sounds
set noerrorbells 

" set the unix shell
if !(has('win16') || has('win32') || has('win64'))
    set shell=/bin/bash
endif

" force windows to use the .vim directory instead of vimfiles
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

colorscheme zenburn

" remove menus, toolbars, and scrollbars
set guioptions-=m
set guioptions-=r
set guioptions-=T


""""""""""""""""""
"    Perforce    "
""""""""""""""""""

nnoremap @pa :!p add %:p
nnoremap @pe :!p edit %:p
nnoremap @pr :!p revert %:p
nnoremap @pd :!p diff %


"""""""""""""""""
"    Plugins    "
"""""""""""""""""


" Easy Motion
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<leader>'

" NERDTree
Bundle 'scrooloose/nerdtree'
map <f2> :NERDTreeToggle<cr>
imap <f2> :NERDTreeToggle<cd>i

" Ctrl P
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|bzr)$'

" TernJS
Bundle 'marijnh/tern_for_vim'

" Syntastic
Bundle 'scrooloose/syntastic'

" Emmet
Bundle 'mattn/emmet-vim'

" Surround
Bundle 'tpope/vim-surround'

" sleuth.vim
Bundle 'tpope/vim-sleuth'
