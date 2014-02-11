" Load vundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

" Sensible.vim
Bundle 'tpope/vim-sensible'
runtime! plugin/sensible.vim


" force windows to use the .vim directory instead of vimfiles
if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif


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

" Themes
Bundle 'covertcj/jellybeans.vim'
Bundle 'covertcj/Zenburn'
Bundle 'covertcj/vim-colors-solarized'


" Tabular - Text Alignment {{{
Bundle 'godlygeek/tabular'

nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:\zs<CR>
vnoremap <Leader>a: :Tabularize /:\zs<CR>
vnoremap <Leader>a, :Tabularize /,\zs<CR>
vnoremap <Leader>a, :Tabularize /,\zs<CR>
" }}}


" CoffeeScript {{{
Bundle 'yourcelf/vim-coffee-script'
" }}}


" Go {{{
set runtimepath+=$GOROOT/misc/vim
" }}}


" Coffee Script {{{
Bundle 'kchmck/vim-coffee-script'
" }}}


" Unite {{{
Bundle 'Shougo/unite.vim'

nnoremap <Leader>up :Unite -no-split file_rec<CR>
nnoremap <Leader>uf :Unite -no-split file<CR>
nnoremap <Leader>ud :Unite -no-split directory<CR>
nnoremap <Leader>uo :Unite -no-split outline<CR>
nnoremap <Leader>uy :Unite -no-split history/yank<CR>
" }}}


" Navigation {{{
Bundle 'wikitopian/hardmode'
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<leader>e'

Bundle 'scrooloose/nerdtree'
nnoremap <f2> :NERDTreeToggle<cr>

Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|bzr)$'

Bundle 'tpope/vim-unimpaired'
" }}}


" Web Development {{{
Bundle 'skammer/vim-css-color'
Bundle 'groenewege/vim-less'
" }}}


" FSharp {{{
Bundle 'kongo2002/fsharp-vim'
" }}}


" Windows Scripting {{{
Bundle 'PProvost/vim-ps1'
" }}}


" WAF Meta-Build System {{{
au BufNewFile,BufRead wscript* set filetype=python
" }}}

Bundle 'scrooloose/syntastic'
"map <F5> :lprev<CR>
"map <F4> :lnext<CR>
let g:syntastic_always_populate_loc_list = 1
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-repeat'


""""""""""""""""""
"    Settings    "
""""""""""""""""""

" ingore files in 'build' or 'bin' directories
" this was added for ctrl-p support, if it becomes annoying, ctrl-p supports
" a custom ignore mapping as well...
set wildignore+=*/build/*,*/bin/*,*\\build\\*,*\\bin\\*

filetype off

" leader button setup
let mapleader = ","
let maplocalleader = "\\"
set timeoutlen=2500

" tab settings
set expandtab
set tabstop=4
set shiftwidth=4

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

" only do case sensitive search if capital letters are present
set ignorecase
set smartcase

" remove menus, toolbars, and scrollbars
set guioptions-=m
set guioptions-=r
set guioptions-=T

" line numbers
:set number

" avoid setting the color scheme before BundleInstall
if filereadable($HOME . '/.vim/bundle/zenburn/colors/zenburn.vim')
    " colorscheme zenburn
    colorscheme jellybeans

    " set background=light
    " colorscheme solarized
endif


"""""""""""""""""""""
"   ININ Settings   "
"""""""""""""""""""""

if $DEV_ENV == 'ININ'

    if $TIER_ROOT_COREWEB != ''
        for coreweb_path in split($TIER_ROOT_COREWEB)
            let jshintrc_path = join([coreweb_path, 'pub', 'src', '.jshintrc'], '/')

            if filereadable(expand(jshintrc_path))
                let g:syntastic_javascript_conf = jshintrc_path
                break
            endif
        endfor
    endif

endif

