require 'os'
require 'fileutils'

home  = ENV['HOME']
vimrc = '_vimrc'
vimrc = '.vimrc' unless OS::Underlying.windows?
vimfiles = '.vim'

vimrc_target = "#{home}/#{vimrc}"
vimrc_source = '.vimrc'

colors_target = "#{home}/#{vimfiles}/colors/"
colors_source = Dir.glob('.vim/colors/*.vim')

file vimrc_target => [vimrc_source] do
    cp(vimrc_source, vimrc_target)
end

file colors_target => colors_source do
    FileUtils.mkdir_p("#{home}/.vim/colors")
    FileUtils.cp(colors_source, colors_target, :verbose => true)
end

desc 'Installs the vundle plugin from it\'s git repository.'
task :clone_vundle do
    `git clone https://github.com/gmarik/vundle.git "#{home}/#{vimfiles}/bundle/vundle"`
end

task :default => [colors_target, vimrc_target, :clone_vundle]

