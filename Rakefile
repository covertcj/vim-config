require 'os'
require 'fileutils'

home  = ENV['HOME']
vimrc = '_vimrc'
vimrc = '.vimrc' unless OS::Underlying.windows?
vimfiles = '.vim'

vimrc_target = "#{home}/#{vimrc}"
vimrc_source = '.vimrc'

zenburn_target = "#{home}/#{vimfiles}/colors/zenburn.vim"
zenburn_source = '.vim/colors/zenburn.vim'

file vimrc_target => [vimrc_source] do
    cp(vimrc_source, vimrc_target)
end

file zenburn_target => zenburn_source do
    FileUtils.mkdir_p("#{home}/.vim/colors")
    FileUtils.copy_file(zenburn_source, zenburn_target)
end

desc 'Installs the vundle plugin from it\'s git repository.'
task :clone_vundle do
    `git clone https://github.com/gmarik/vundle.git "#{home}/#{vimfiles}/bundle/vundle"`
end

task :default => [zenburn_target, vimrc_target, :clone_vundle]

