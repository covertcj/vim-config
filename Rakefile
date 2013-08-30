require 'fileutils'

home  = ENV['HOME']
vimrc = '_vimrc'
vimrc = '.vimrc' unless Rake::Win32.windows?
vimfiles = '.vim'

vundle_target = "#{home}/#{vimfiles}/bundle/vundle"

vimrc_target = "#{home}/#{vimrc}"
vimrc_source = '.vimrc'

colors_target = "#{home}/#{vimfiles}/colors/"
colors_source = Dir.glob('.vim/colors/*.vim')

file vimrc_target => [vimrc_source] do
    cp vimrc_source, vimrc_target
end

file colors_target => colors_source do
    mkdir_p "#{home}/.vim/colors"
    cp colors_source, colors_target
end

desc 'Installs the vundle plugin from it\'s git repository.'
file vundle_target do
    `git clone https://github.com/gmarik/vundle.git "#{vundle_target}"`
end

task :default => [colors_target, vimrc_target, vundle_target]

