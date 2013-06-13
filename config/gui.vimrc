" options specific to gui/terminal
" (the console vim should be a bit more light weight)
if has("gui_running")
  " remove all those annoying menus and scrollbars
  set guioptions=

  " open up the nerd tree by default
  if has("win32")
    autocmd vimenter * NERDTree C:\
  else
    autocmd vimenter * NERDTree
  endif
endif

