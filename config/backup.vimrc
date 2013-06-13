set backup      " turn backups on

" generate the backup/temp directory paths
if has("win32")
	let backup_dir = expand("~/vimfiles/backups")
	let tmp_dir = expand("~/vimfiles/backups")
else
	let backup_dir = expand("~/.vim/backups")
	let tmp_dir = expand("~/.vim/backups")
endif

" create the directories if they don't exist
if (!isdirectory(backup_dir))
	call mkdir(backup_dir, "p")
endif
if (!isdirectory(tmp_dir))
	call mkdir(tmp_dir, "p")
endif

let &backupdir = backup_dir    " backups directory
let &directory = tmp_dir       " temporary files directory
