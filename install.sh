#!/bin/bash

initial_dir=$(pwd)
#script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" >/dev/null 2>&1 && pwd  )"
script_dir=$(dirname "$0")
cd "$script_dir"

git submodule update --init --recursive

install_dir=$HOME

# Copy every entry into $HOME, skipping only the current/parent directory
# references. Note that .git is copied on purpose: this way $HOME becomes a
# checkout of this repository and new commits/changes can be made directly
# from the home directory.
for f in $(ls -a -1); do
    case "$f" in
        .|..) continue ;;
    esac
    cp -rf "$f" "$install_dir"
done

# Install external command line tools (bat, ripgrep, fd, fzf, ...).
./bootstrap.sh

cd "$initial_dir"
