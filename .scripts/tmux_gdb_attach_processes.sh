#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: You have to pass name of process for attach!"
    exit 1
fi

function create_commands() {
    processes=$(ps ax | grep "$1" | grep -v "grep" | grep -v "tmux_gdb_attach_processes.sh")
    IFS=$'\n'
    for line in $processes
    do
        pid=$(echo "$line" | awk '{ print $1 }')
        proc=$(echo $line | awk '{for(i=5;i<=NF;i++) printf $i " "}')
        tmux send-keys -t $session_name "sudo -E vim -c \"ConqueGdb -d ${PWD} --args ${proc}\" -c \"ConqueGdbCommand attach ${pid}\""
        tmux split-window -t $session_name
        tmux select-layout tiled
    done
}

process_name="$1"
session_name="tmux-gdb-${process_name}"
new_tmux_window=0

if [ -n "$TMUX" ]; then
    echo "You are in tmux session. Should I open new window? (y/n): "
    read yn
    case $yn in
        [Yy]* ) new_tmux_window=1; session_name=`tmux display-message -p "#S"`;;
        [Nn]* ) new_tmux_window=0;;
        * ) echo "Please answer y or n or press Ctrl+C for interrupt."; return 1;;
    esac
fi


tmux has-session -t $session_name 2> /dev/null
has_session=$?
if [ $new_tmux_window -eq 1 ]; then
    tmux new-window -c ${PWD} -n $session_name
elif [ $has_session -ne 0 ]; then
    tmux new-session -d -s $session_name -c ${PWD}
fi
if [ $new_tmux_window -eq 1 ] || [ $has_session -ne 0 ]; then
    create_commands $process_name
fi
if [ -z "$TMUX" ]; then
    tmux attach -t $session_name
elif [ $has_session -ne 0 ]; then
    tmux switch-client -t $session_name
fi

