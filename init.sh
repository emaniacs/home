#!/bin/bash

SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

usage() {
    cat <<EOF
    Usage: $0 app
    Initialize app configuration

    App Name:
        alls
            all of apps will be configurated
        vim|nvim
            ~/.vim/tmp/{undo,yank,backup}
            ~/.vimrc
            ~/.config/nvim/init.vim
        inputrc|editrc
            ~/.inputrc
            ~/.editrc
        ctags
            ~/.ctags
EOF
}

init_all() {
    init_input
    init_ctags
    init_vi
    init_screenrc
}

init_input() {
    ln -v -s "$SCRIPTDIR/.editrc" "$HOME/.editrc"
    ln -v -s "$SCRIPTDIR/.inputrc" "$HOME/.inputrc"
}

init_ctags() {
    ln -v -s "$SCRIPTDIR/.ctags" "$HOME/.ctags"
}

init_screenrc() {
    ln -v -s "$SCRIPTDIR/.screenrc" "$HOME/.screenrc"
    ln -v -s "$SCRIPTDIR/.tmux.conf" "$HOME/.tmux.conf"
}

init_vi() {
    mkdir -vp "$HOME/.vim/tmp/backup"
    mkdir -vp "$HOME/.vim/tmp/yank"
    mkdir -vp "$HOME/.vim/tmp/undo"
    mkdir -vp "$HOME/.config/nvim"
    ln -vs "$SCRIPTDIR/.vimrc" "$HOME/.vimrc"
    ln -vs "$SCRIPTDIR/.vimrc" "$HOME/.config/nvim/init.vim"
}

init_i3wm() {
    echo 'ok'
}


case $1 in 
    alls)
        init_all
        ;;
    inputrc|editrc)
        init_input
        ;;
    vi|vim|nvim)
        init_vi
        ;;
    *)
        usage
        ;;
esac
