#!/bin/bash

function set_main_dir() {
    local dir="$1"

    if [[ ! -n "$dir" ]]; then
        read -p "Enter directory (absolute path): " dir
    fi

    main_dir="$dir"
}

function setup_workspace() {
    sub_dirs=($(find "$main_dir" -maxdepth 1 -type d))
    if [[ ${#sub_dirs[@]} -eq 0 ]]; then
        echo "No sub-directories found in $main_dir"
        exit 1
    fi

    session=$(basename "$main_dir")
    tmux new-session -d -s $session

     for i in "${!sub_dirs[@]}"; do
        sub_dir="${sub_dirs[$i]}"
        window=$(basename "$sub_dir")

        if [[ -z "$(ls -A "$sub_dir")" ]]; then
            echo "Skipping $sub_dir, its empty"
            exit 1
        fi


        if [[ "$i" != 0 && ! -d "$sub_dir/.git" ]]; then
            echo "Skipping $window not a git repo"
            exit 1
        fi

        tmux neww -c "$sub_dir" -n "$window" 
    done
}

set_main_dir "$1"
setup_workspace
echo "BOI! itz done! go kill it!"



