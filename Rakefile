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
    puts '****************************************'
    puts '**   Cloning Vundle Plugin            **'
    puts '****************************************'
    puts ''

    cp vimrc_source, vimrc_target

    puts ''
    puts ''
end

file colors_target => colors_source do
    puts '****************************************'
    puts '**   Copying Colors Directory         **'
    puts '****************************************'
    puts ''

    mkdir_p "#{home}/.vim/colors"
    cp colors_source, colors_target

    puts ''
    puts ''
end

desc 'Installs the vundle plugin from it\'s git repository.'
file vundle_target do
    puts '****************************************'
    puts '**   Cloning Vundle Plugin            **'
    puts '****************************************'
    puts ''

    `git clone https://github.com/gmarik/vundle.git "#{vundle_target}"`

    puts ''
    puts ''
end

task :default => [colors_target, vimrc_target, vundle_target]

