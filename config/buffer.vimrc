" ctrl + h and ctrl + l will switch buffers
nmap <C-H> :bp<CR>
nmap <C-L> :bn<CR>

" setup buftab
:let g:buftabs_only_basename=1
:let g:buftabs_active_highlight_group="Visual"

" allow Ctrl + W to close a buffer without closing the window
nmap <C-W>q <Plug>Kwbd 
