#!/bin/bash

process() {
while read input; do 
  case "$input" in
    UNBLANK*)	/usr/bin/purple-remote "setstatus?status=available&message=" ;;
    LOCK*)	/usr/bin/purple-remote "setstatus?status=away&message=" ;;
  esac
done
}

/usr/bin/xscreensaver-command -watch | process
