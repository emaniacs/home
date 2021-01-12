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

init_apps() {
    # install some packages
    # trans git
    echo "complete this to install some apps ;)"
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
    # support universal ctags
    mkdir "$HOME"/.ctags.d/""
    ln -v -s "$SCRIPTDIR/universal.ctags" "$HOME/.ctags.d/"
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
    mkdir -vp "$HOME/.config/i3/"
    ln -vs "$SCRIPTDIR/.config/i3/config" "$HOME/.config/i3/config"
    ln -vs "$SCRIPTDIR/.i3status.conf" "$HOME/.i3status.conf"
}

init_git() {
    # initialize global hooks
    # https://stackoverflow.com/a/37293198
    git config --global core.hooksPath "$SCRIPTDIR/scripts/git-hooks/"
}

init_qterminal() {
    # https://superuser.com/a/1128905
    which qterminal || (echo 'Qterminal not found' ; exit 255)
    mkdir -pv ~/.config/systemd/user
    ln -vs "$SCRIPTDIR/.config/systemd/user/qterminal.service" "$HOME/.config/systemd/user/" && \
        systemctl --user enable qterminal && \
        systemctl --user start qterminal
}

case $1 in 
    alls)
        init_all
        ;;
    ctags)
        init_ctags
        ;;
    apps)
        init_apps
        ;;
    inputrc|editrc)
        init_input
        ;;
    vi|vim|nvim)
        init_vi
        ;;
    i3|i3wm)
        init_i3wm
        ;;
    git)
        init_git
        ;;
    qterminal)
        init_qterminal
        ;;
    *)
        usage
        ;;
esac
