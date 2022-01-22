#!/bin/bash

paths="$HOME"

function set_paths() {
    if [ -d ~/work ]; then
        paths+=" $HOME/work"
        if [ -d ~/work/insider ]; then 
            paths+=" $HOME/work/insider"
            [ -d ~/work/insider/repos ] && paths+=" $HOME/work/insider/repos"
            [ -d ~/work/insider/extra ] && paths+=" $HOME/work/insider/extra"
            [ -d ~/work/insider/bare-repos ] && paths+=" $HOME/work/insider/bare-repos"
        fi
    fi

    if [ -d ~/personal ]; then
        paths+=" $HOME/personal"
        [ -d ~/personal/JS ] && paths+=" $HOME/personal/JS"
        [ -d ~/personal/scripts ] && paths+=" $HOME/personal/scripts"
    fi
}
set_paths

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find $paths -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t $selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name

