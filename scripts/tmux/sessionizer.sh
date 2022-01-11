#!/bin/bash

function set_main_dir() {
    local dir="$1"

    if [[ ! -n "$dir" ]]; then
        read -p "Enter directory: " dir
    fi

    main_dir="$dir"
}

function create_session() {
    s_name=$(basename "$d")
    w_name=$s_name
    tmux new -d -c "$d" -s "$s_name" -n "$w_name"
    tmux send-keys -t $s_name 'vim'
}

function setup_workspace() {
    sub_dirs=($(find "$main_dir" -maxdepth 1 -type d))
    for d in "${sub_dirs[@]}"; do
        create_session "$d"
    done
}

set_main_dir "$1"
setup_workspace


