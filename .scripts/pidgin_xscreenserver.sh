#!/bin/bash

running=`ps -ax | grep "pidgin_xscreenserver.sh" | grep -v "grep" | wc -l`
if [ $running -ge 3 ]; then
    exit 0
fi

process() {
while read input; do 
  case "$input" in
    UNBLANK*)	/usr/bin/purple-remote "setstatus?status=available&message=" ;;
    LOCK*)	/usr/bin/purple-remote "setstatus?status=away&message=" ;;
  esac
done
}

/usr/bin/xscreensaver-command -watch | process
