username  = node[:dotfiles][:user]
groupname = node[:dotfiles][:group]
home_dir  = node[:dotfiles][:home]

vim_dir = File.join(home_dir, '.vim')
vimrc   = File.join(home_dir, '.vimrc')
bundle_dir = File.join(vim_dir, 'bundle')

vimconfig_dir    = File.join(home_dir, '.vim-config')
vimconfig_remote = 'https://github.com/covertcj/vim-config.git'

neobundle_dir    = File.join(bundle_dir, 'neobundle.vim')
neobundle_remote = 'https://github.com/Shougo/neobundle.vim.git'

package 'git' do
    action  :install
end

package 'vim' do
    action  :install
end

directory vim_dir do
    owner   username
    mode    '0755'
    action  :create
end

directory bundle_dir do
    owner   username
    mode    '0755'
    action  :create
end

git vimconfig_dir do
    repository  vimconfig_remote
    user        username
end

git neobundle_dir do
    repository  neobundle_remote
    user        username
end

cookbook_file vimrc do
    source  'vimrc'
    owner   username
end

neobundle_installer = File.join(neobundle_dir, 'bin', 'neoinstall')
bash neobundle_installer do
    user    username
    code    "bash #{neobundle_installer}"
end
