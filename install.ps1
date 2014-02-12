Write-Host ""
Write-Host ""
Write-Host ("*" * 79)
Write-Host "* Vim Configuration"
Write-Host ("*" * 79)

$VIM_DIR    = Join-Path($Env:USERPROFILE, ".vim")
$BUNDLE_DIR = Join-Path($VIM_DIR, "bundle")
$VIMRC      = Join-Path($VIM_DIR, "_vimrc")

$NEOBUNDLE_REMOTE = "https://github/Shougo/neobundle.vim.git"
$NEOBUNDLE_LOCAL  = Join-Path($BUNDLE_DIR, "neobundle.vim")

$REPO_REMOTE = "https://github.com/covertcj/vim-config.git"
$REPO_LOCAL  = Join-Path($Env:USERPROFILE, ".vim-config")
$REPO_BRANCH = "master"

if (!(Test-Path($BUNDLE_DIR))) {
    New-Item -ItemType Directory -Path $BUNDLE_DIR 
}

# clone/pull the configuration repo
if (Test-Path($REPO_LOCAL)) {
    pushd $REPO_LOCAL

    git checkout $REPO_BRANCH
    git pull origin $REPO_BRANCH

    popd
} else {
    git clone $REPO_REMOTE $REPO_LOCAL

    pushd $REPO_LOCAL
    git checkout $REPO_BRANCH
    popd
}

# clone/pull neobundle
if (Test-Path($NEOBUNDLE_LOCAL)) {
    git clone $NEOBUNDLE_REMOTE $NEOBUNDLE_LOCAL
} else {
    pushd $NEOBUNDLE_LOCAL
    git pull origin master
    popd
}

# backup if needed
if (Test-Path($VIMRC)) {
    cp $VIMRC ($VIMRC + '.b')
}

# link the fake vimrc for vimproc
cmd /c mklink $VIMRC Join-Path($REPO_LOCAL, ".vimrc-vimproc")

# run NeoBundle on the fake vimrc
$NEOBUNDLE_LOCAL/bin/neoinstall_novimproc.bat
rm $VIMRC

# create the real links
cmd /c mklink $VIMRC Join-Path($REPO_LOCAL, ".vimrc")

# run NeoBundle on real vimrc
$NEOBUNDLE_LOCAL/bin/neoinstall.bat
