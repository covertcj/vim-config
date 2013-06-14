" load pathogen with the default bundles file
call pathogen#infect()

if has('win32')
	source ~/vimfiles/config/general.vimrc
	source ~/vimfiles/config/backup.vimrc
	source ~/vimfiles/config/buffer.vimrc
	source ~/vimfiles/config/font.vimrc
	source ~/vimfiles/config/gui.vimrc
else
	source ~/.vim/config/general.vimrc
	source ~/.vim/config/backup.vimrc
	source ~/.vim/config/buffer.vimrc
	source ~/.vim/config/font.vimrc
	source ~/.vim/config/gui.vimrc
endif

" allow usage of <C-t>f to open FuzzyFinder in the current dir
" nmap <C-t>f :FufFileWithCurrentBufferDir <CR>

