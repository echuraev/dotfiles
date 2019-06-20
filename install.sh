#!/bin/bash

initial_dir=$(pwd)
#script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" >/dev/null 2>&1 && pwd  )"
script_dir=$(dirname "$0")
cd $script_dir

git submodule update --init --recursive

install_dir=$HOME
FILES=`ls -a -1`

for f in $FILES; do
    cp -rf $f $install_dir
done

cd $initial_dir
