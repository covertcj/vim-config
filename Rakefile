task :reset   => [:clean, :install]
task :clean   => [:remove_files]
task :install => [:copy_files]

task :copy_files do
  osys = ENV['OS']
  home = ENV['HOME']
  vimfiles = getVimfilesDir(osys)
  vimrc    = getVimrcFile(osys)

  if (vimfiles == nil) then
    puts "Operating System '#{osys}' isn't supported."
    return 1
  end

  FileUtils.mkdir_p "#{home}/#{vimfiles}"
  FileUtils.cp_r ['autoload', 'bundle', 'colors', 'config'], "#{home}/#{vimfiles}"
  FileUtils.cp "_vimrc", "#{home}/#{vimrc}"
end

task :remove_files do
  osys = ENV['OS']
  home = ENV['HOME']
  vimfiles = getVimfilesDir(osys)
  vimrc    = getVimrcFile(osys)

  if (vimfiles == nil) then
    puts "Operating System '#{osys}' isn't supported."
    return 1
  end

  FileUtils.remove_dir "#{home}/#{vimfiles}"
  FileUtils.remove "#{home}/#{vimrc}"
end

def getVimfilesDir(osys)
  if osys == 'Windows_NT' then
    return 'vimfiles'
  end

  return nil
end

def getVimrcFile(osys)
  if osys == 'Windows_NT' then
    return '_vimrc'
  end
end

