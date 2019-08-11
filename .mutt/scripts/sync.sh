#!/bin/bash

ACCOUNT="${1:--a}"
BACKOFF=0
MAX_BACKOFF=480 # 8 minutes

PIDFILE="$HOME/.mutt/tmp/sync-$1.pid"
echo $$ > "$PIDFILE"
trap "rm -f '$PIDFILE'; exit" SIGTERM

function delay() {
  if [ $BACKOFF -ne 0 ]; then
    echo "Backing off for ${BACKOFF}s."
    sleep $BACKOFF
  fi
}

function backoff() {
  if [ $BACKOFF -eq 0 ]; then
    BACKOFF=60
  elif [ $BACKOFF -ge $MAX_BACKOFF ]; then
    BACKOFF=$MAX_BACKOFF
  else
    BACKOFF=$(expr $BACKOFF '*' 2)
  fi
}

while true; do
  delay

  echo "Running imapfilter:"
  echo

  time imapfilter -v || {
    terminal-notifier -title imapfilter -message "imapfilter exited"
    backoff
    continue
  }

  echo
  echo "Running mbsync ($ACCOUNT):"
  echo

  MBSYNC_OUT_FILE="/tmp/mbsync_out_$ACCOUNT.log"

  time timeout 3600 mbsync $ACCOUNT -Dm > $MBSYNC_OUT_FILE || {
    terminal-notifier -title mbsync -message "mbsync ($ACCOUNT) exited"
    backoff
    continue
  }

  ${HOME}/.mutt/scripts/mbsync_out_parser.py $MBSYNC_OUT_FILE || {
    NUM=$?
    MSG="$ACCOUNT: "
    if [[ "$ACCOUNT" == "-a" ]]; then
        MSG=""
    fi
    MSG=${MSG}${NUM}
    if [ "$?" -gt "1" ]; then
        MSG=$MSG" new message"
    else
        MSG=$MSG" new messages"
    fi
    echo "Running imapfilter:"
    echo

    time imapfilter -v || {
      terminal-notifier -title imapfilter -message "imapfilter exited"
      backoff
      continue
    }
    terminal-notifier -title mbsync -message "${MSG}"
    echo "${MSG}"
  }

  rm -f $MBSYNC_OUT_FILE

  echo "Running notmuch:"
  echo

  time notmuch new || {
    terminal-notifier -title notmuch -message "notmuch exited"
    backoff
    continue
  }

  echo
  echo "Running lbdb-fetchaddr:"
  echo
  BD_EXISTS=`ls -1 ~/.lbdb | grep -c -v "lbdbrc"`
  if [ "$BD_EXISTS" -eq 0 ]
  then
      time find ~/.mail/ -type f -exec sh -c 'cat "{}" | lbdb-fetchaddr' \;
  fi
  # files that were modified the last hour
  time find ~/.mail/ -type f -mtime -1h -exec sh -c 'cat "{}" | lbdb-fetchaddr' \;

  echo
  echo "Updating mailboxes listing:"
  echo

  ~/.mutt/scripts/mailboxes.py

  echo "Finished at $(date)."
  echo "Sleeping for 30s..."
  echo

  BACKOFF=0
  sleep 30
done

