"Load vundle
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


set statusline=%t       "tail of the filename
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag

" following 3 are from the syntastic recomendations
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline+=%=      "left/right separator

set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

nnoremap l ,
nnoremap h <nop>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

iabbrev @@  covertops5@gmail.com
iabbrev @@i chris.covert@inin.com


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

Bundle 'rmartinho/vim-cpp11'

Bundle 'vim-scripts/glsl.vim'


" TypeScript {{{
Bundle 'leafgarland/typescript-vim'
" }}}

"
" Rust {{{
Bundle 'wting/rust.vim'
" }}}


" Tabular - Text Alignment {{{
Bundle 'godlygeek/tabular'

nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a, :Tabularize /,\zs<CR>
vmap <Leader>a, :Tabularize /,\zs<CR>
" }}}


" Lisp-y Languages {{{
Bundle "kien/rainbow_parentheses.vim"
nmap <Leader>pt :RainbowParenthesesToggle<CR>
au BufEnter *.scm RainbowParenthesesActivate
au BufEnter *.scm RainbowParenthesesLoadRound
" }}}


" Navigation {{{
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<leader>e'
nmap <leader>w <Plug>(easymotion-w)
nmap <leader>f <Plug>(easymotion-f)
nmap <leader>F <Plug>(easymotion-F)

Bundle 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>

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


" Windows Scripting {{{
Bundle 'PProvost/vim-ps1'
" }}}


" WAF Meta-Build System {{{
au BufNewFile,BufRead wscript* set filetype=python
" }}}

Bundle 'scrooloose/syntastic'
noremap <F5> :lprev<CR>
noremap <F4> :lnext<CR>
nnoremap <leader>st :SyntasticToggleMode<CR>
nnoremap <leader>sc :SyntasticCheck<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_no_include_search = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_compiler_options = '-std=c++0x'


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
set wildignore+=*/node_modules/*,*\\node_modules\\*,*/bower_components/*,*\\bower_components\\*

filetype off

" leader button setup
let mapleader = ","
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

if $TIER_ROOT_COREWEB != ''
    for coreweb_path in split($TIER_ROOT_COREWEB)
        let jshintrc_path = join([coreweb_path, 'pub', 'src', '.jshintrc'], '/')

        if filereadable(expand(jshintrc_path))
            if exists('g:javascript_jshint_args')
                let g:syntastic_javascript_jshint_args = g:syntastic_javascript_jshint_args . ' --config "' . jshintrc_path . '"'
            else
                let g:syntastic_javascript_jshint_args = '--config "' . jshintrc_path . '"'
            endif
            break
        endif
    endfor
endif

