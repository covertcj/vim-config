require 'os'

task :reset   => [:clean, :install]
task :clean   => [:remove_files]
task :install => [:copy_files]

task :copy_files do
  home = ENV['HOME']
  vimfiles = getVimfilesDir()
  vimrc    = getVimrcFile()

  FileUtils.mkdir_p "#{home}/#{vimfiles}"
  FileUtils.cp_r ['autoload', 'bundle', 'colors', 'config'], "#{home}/#{vimfiles}"
  FileUtils.cp "_vimrc", "#{home}/#{vimrc}"
end

task :remove_files do
  home = ENV['HOME']
  vimfiles = getVimfilesDir()
  vimrc    = getVimrcFile()

  FileUtils.remove_dir "#{home}/#{vimfiles}"
  FileUtils.remove "#{home}/#{vimrc}"
end

def getVimfilesDir()
  return '.vim' unless OS::Underlying.windows?
  return 'vimfiles' 
end

def getVimrcFile()
  return '.vimrc' unless OS::Underlying.windows?
  return '_vimrc' 
end

