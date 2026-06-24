#!/bin/bash
# Bootstrap external command line tools that are not managed by a system
# package manager (bat, ripgrep, fd, fzf, tmux plugin manager,
# translate-shell, ...).

set -u

LOCAL_BIN=${HOME}/.bin
ZSH_COMPL_DIR="$HOME/.zsh/completion"
mkdir -p "$LOCAL_BIN"
mkdir -p "$ZSH_COMPL_DIR"

isAndroidOS() {
    if [[ `uname` != 'Darwin' ]]; then
        [[ `uname -o` == 'Android' ]]
    else
        false
    fi
}

# Install function {{{ #
function install_tool() {
    github_repo=$1
    tool_name=$2
    tool_version=$3
    full_name=${4:-$tool_name}
    TOOL_BIN=$LOCAL_BIN/$tool_name
    # TODO: Rewrite next lines maybe with `gh release view` and python
    LINUX_ENDING=${5:-'x86_64-unknown-linux-musl'}
    MACOS_ENDING=${6:-'x86_64-apple-darwin'}
    tool_version_archive=${7:-$tool_version}
    if [ ! -f $TOOL_BIN ]; then
        if [[ `uname` != 'Darwin' ]]; then
            export archive_name=$full_name'-'$tool_version_archive'-'$LINUX_ENDING
        else
            export archive_name=$full_name'-'$tool_version_archive'-'$MACOS_ENDING
        fi
        tmp_dir='/tmp/'
        if isAndroidOS; then
            tmp_dir='~/tmp/'
            mkdir -p $tmp_dir
        fi
        wget -O $tmp_dir/$archive_name.tar.gz $github_repo/releases/download/$tool_version/$archive_name.tar.gz
        tar xf $tmp_dir/$archive_name.tar.gz -C $tmp_dir
        if [ ! -f $tmp_dir/$archive_name/$tool_name ]; then
            echo "$tmp_dir/$tool_name"
            cp -f $tmp_dir/$tool_name $TOOL_BIN
        else
            echo "$tmp_dir/$archive_name"
            cp -f $tmp_dir/$archive_name/$tool_name $TOOL_BIN
        fi
    fi
}
# }}} Install function #
# Install bat {{{ #
TOOL_BIN=$LOCAL_BIN/bat
if [ ! -f $TOOL_BIN ]; then
    echo "Installing bat"
    install_tool 'https://github.com/sharkdp/bat' 'bat' 'v0.24.0'
fi
# }}} Install bat #
# Install ripgrep {{{ #
TOOL_BIN=$LOCAL_BIN/rg
if [ ! -f $TOOL_BIN ]; then
    echo "Installing ripgrep"
    res=$(install_tool 'https://github.com/BurntSushi/ripgrep' 'rg' '13.0.0' 'ripgrep')
    # Enable autocompletion
    cp -f $res/complete/_rg $ZSH_COMPL_DIR
fi
# }}} Install ripgrep #
# Install fd {{{ #
TOOL_BIN=$LOCAL_BIN/fd
if [ ! -f $TOOL_BIN ]; then
    echo "Installing fd"
    res=$(install_tool 'https://github.com/sharkdp/fd' 'fd' 'v8.7.0')
    # Enable autocompletion
    cp -f $res/autocomplete/_fd $ZSH_COMPL_DIR
fi
# }}} Install fd #
# Install fzf {{{ #
TOOL_BIN=$LOCAL_BIN/fzf
if [ ! -f $TOOL_BIN ]; then
    echo "Installing fzf"
    res=$(install_tool 'https://github.com/junegunn/fzf' 'fzf' 'v0.55.0' 'fzf' 'linux_amd64' 'darwin_amd64' '0.55.0')
fi
# }}} Install fzf #
# Instal Tmux Plugin Manager {{{ #
TPM_DIR=$HOME/.tmux/plugins/tpm
if [ ! -d $TPM_DIR ]; then
    git clone https://github.com/tmux-plugins/tpm $TPM_DIR
fi
# }}} Instal Tmux Plugin Manager #
# Install translate-shell {{{ #
TRANS_BIN=$LOCAL_BIN/trans
if [ ! -f $TRANS_BIN ]; then
    wget -O $TRANS_BIN git.io/trans
    chmod +x $TRANS_BIN
fi
# }}} Install translate-shell #
