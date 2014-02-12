#! /bin/sh

##### Settings #####

VIM_DIR="$HOME/.vim"
BUNDLE_DIR="$VIM_DIR/bundle"
VIMRC="$HOME/.vimrc"

NEOBUNDLE_REMOTE="https://github.com/Shougo/neobundle.vim.git"
NEOBUNDLE_LOCAL="$BUNDLE_DIR/neobundle.vim"

REPO_REMOTE="https://github.com/covertcj/vim-config.git"
REPO_LOCAL="$HOME/.vimrc-config"
REPO_BRANCH="install"

##### Utilities #####

msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
        msg "\e[32m[✔]\e[0m ${1}${2}"
    fi
}

error() {
    msg "\e[31m[✘]\e[0m ${1}${2}"
    exit 1
}

check_command() {
    local ret='0'
    type $1 &> /dev/null || { local ret='1'; }

    if [ ! "$ret" -eq '0' ]; then
        error "$2"
    fi
}

##### Script Main #####

check_command "vim"  "Please install vim before running this script!"
check_command "git"  "Please install git before running this script!"
check_command "ruby" "Please install ruby before running this script!"
check_command "rake" "Please install rake before running this script!"

mkdir -p $BUNDLE_DIR

# clone/update the local config repo
msg ""
msg "#########################################"
if [ ! -d "$REPO_LOCAL" ]; then
    msg "# Cloning vim-config repo"

    git clone "$REPO_REMOTE" "$REPO_LOCAL"

    pushd "$REPO_LOCAL"
    git checkout "$REPO_BRANCH"
    popd
else
    msg "# Pulling vim-config repo"

    pushd "$REPO_LOCAL"
    git checkout "$REPO_BRANCH"
    git pull origin "$REPO_BRANCH"
    popd
fi

# clone/update neobundle
msg ""
msg "#########################################"
if [ ! -d "$NEOBUNDLE_LOCAL" ]; then
    msg "# Cloning NeoBundle repo"
    git clone "$NEOBUNDLE_REMOTE" "$NEOBUNDLE_LOCAL"
else
    msg "# Pulling NeoBundle repo"

    pushd "$NEOBUNDLE_LOCAL"
    git pull origin master
    popd
fi

# backup pre-existing configuration
msg ""
msg "#########################################"
if [ -e "$VIMRC" ]; then
    msg "# Backing up to $VIMRC.b"
    cp "$VIMRC" "$VIMRC.b"
    rm "$VIMRC"
fi

# run NeoBundle on a special vimproc vimrc
msg ""
msg "#########################################"
msg "# NeoBundle the vimproc vimrc"
ln "$REPO_LOCAL/.vimrc-vimproc" "$VIMRC"
$NEOBUNDLE_LOCAL/bin/neoinstall &> /dev/null
rm -f $VIMRC

# create links
msg ""
msg "#########################################"
msg "# Symlinking the full vimrc"
ln "$REPO_LOCAL/.vimrc" "$VIMRC"

# run NeoBundle on full vimrc
msg ""
msg "#########################################"
msg "# NeoBundle the full vimrc"
$NEOBUNDLE_LOCAL/bin/neoinstall
