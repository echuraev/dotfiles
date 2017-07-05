#!/bin/bash

install_dir=$HOME
FILES=$(dirname "$0")/*
HFILES=$(dirname "$0")/.*

for f in $FILES; do
    cp -rf $f $install_dir
done

for f in $HFILES; do
    cp -rf $f $install_dir
done