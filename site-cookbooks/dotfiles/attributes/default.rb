default[:dotfiles][:user]  = 'vagrant'
default[:dotfiles][:home]  = File.join('/home', default[:dotfiles][:user])
default[:dotfiles][:group] = default[:dotfiles][:user]
