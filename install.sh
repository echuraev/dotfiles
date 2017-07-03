#!/bin/bash

install_dir=$HOME

for f in *; do
    cp -rf $f $install_dir
done
