include_recipe "chocolatey" if platform? 'windows'

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

%w{git vim}.each do |pkg|
    if platform? 'windows' then
        chocolatey pkg { action :install }
    else
        package pkg do
            action :install
        end
    end
end

directory bundle_dir do
    action      :create

    recursive   true
    owner       username
    mode        '0755'
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

neobundle_bindir = File.join(neobundle_dir, 'bin')
if platform? 'windows' then
    neobundle_installer = File.join(neobundle_bindir, 'neoinstall')

    powershell_script neobundle_installer do
        code    <<-EOH
            #{neobundle_installer}
            EOH
    end
else
    neobundle_installer = File.join(neobundle_bindir, 'neoinstall_novimproc.bat')

    bash neobundle_installer do
        user    username
        code    <<-EOH
            bash #{neobundle_installer}"
            EOH
    end
end
