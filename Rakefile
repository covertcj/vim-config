require 'fileutils'

home  = ENV['HOME']
vimfiles = '.vim'
vimrc = '_vimrc'
vimrc = '.vimrc' unless Rake::Win32.windows?

vundle_target = "#{home}/#{vimfiles}/bundle/vundle"

vimrc_target = "#{home}/#{vimrc}"
vimrc_source = '.vimrc'

file vimrc_target => [vimrc_source] do
    cp vimrc_source, vimrc_target
end

desc 'Installs the vundle plugin from it\'s git repository.'
file vundle_target do
    `git clone https://github.com/gmarik/vundle.git "#{vundle_target}"`
end

desc 'Installs vim plugins using vundle.'
task :vim_bundle_install => [vimrc_target, vundle_target] do
    `vim +BundleInstall +qall`
end

task :vim_config => [vimrc_target, vundle_target, :vim_bundle_install]
task :default => [:vim_config]

