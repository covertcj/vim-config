require 'fileutils'

home  = ENV['HOME']

vimfiles = '.vim'
vimfiles_target = "#{home}/#{vimfiles}"

vimrc_prefix = ((Rake::Win32.windows? && '_') || '.')
vimrc = "#{vimrc_prefix}vimrc"

neobundle_target = "#{vimfiles_target}/bundle/neobundle.vim"

vimrc_target = "#{home}/#{vimrc}"
vimrc_source = '.vimrc'

file vimrc_target => [vimrc_source] do
    cp vimrc_source, vimrc_target
end

desc 'Installs the vundle plugin from it\'s git repository.'
file neobundle_target do
    `git clone https://github.com/Shougo/neobundle.vim.git "#{neobundle_target}"`
end

desc 'Installs vim plugins using vundle.'
task :vim_bundle_install => [vimrc_target, neobundle_target] do
    puts 'Running :BundleInstall...'
    sh "#{neobundle_target}/bin/neoinstall"
end

def system_is_dirty?(files)
    needed = false
    files.each { |f| needed ||= File.exists?(f) }
    return needed
end

def ask_for_confirmation(files)
    puts 'This is a destructive operation, and will remove the following files on your local system:'
    files.each { |f| puts "\t#{f}" }

    puts ''
    print 'Enter \'yes\' to continue: '

    answer = STDIN.gets.strip
    unless answer == 'yes'
        puts 'Cancelling...'
        exit(1)
    end
end

desc 'Removes your systems\'s vim configuration.'
task :clean do
    files = [
        vimrc_target,
        vimfiles_target
    ]

    if system_is_dirty?(files) then
        ask_for_confirmation(files)

        puts ''
        files.each do |f|
            FileUtils.rm_rf(f, :verbose => true)
        end
    end
end

task :vim_config => [:clean, vimrc_target, neobundle_target, :vim_bundle_install]
task :default => [:vim_config]

