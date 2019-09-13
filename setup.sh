#!/bin/bash


symlink() {
    printf "Symlinking '%s', to path '%s'\n" "repo/$1" "$HOME/$2"
    ln -s "$(realpath ./"$1")" "$HOME/$2"
}


symlink "bashrc" ".bashrc"
symlink "scripts/workflow.sh" "scripts/workflow.sh"

#ln -s "$(realpath ./file)" "$HOME/.file"
#ln -s "$(realpath ./bashrc)" "$HOME/.bashrc"
