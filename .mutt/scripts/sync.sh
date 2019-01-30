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
  #if [ -x "${HOME}/.mutt/hooks/presync/${ACCOUNT}.sh" ]; then
  #  "${HOME}/.mutt/hooks/presync/${ACCOUNT}.sh" || {
  #    echo "Presync hook exited with status $?; skipping sync."
  #    sleep 60
  #    BACKOFF=0
  #    continue
  #  }
  #fi
  #if [ -x "${HOME}/.mutt/hooks/presync.sh" ]; then
  #  "${HOME}/.mutt/hooks/presync.sh" || {
  #    echo "Presync hook exited with status $?; skipping sync."
  #    sleep 60
  #    BACKOFF=0
  #    continue
  #  }
  #fi

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

  time gtimeout 3600 mbsync $ACCOUNT -Dm > $MBSYNC_OUT_FILE || {
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

  #echo
  #echo "Running postsync hooks ($ACCOUNT):"
  #echo

  #time ~/.mutt/hooks/postsync/$ACCOUNT.sh # Runs notmuch, lbdb-fetchaddr etc
  #echo
  #echo "Running postsync hooks:"
  #echo

  #time ~/.mutt/hooks/postsync.sh # Runs notmuch, lbdb-fetchaddr etc

  echo
  echo "Updating mailboxes listing:"

  ~/.mutt/scripts/mailboxes.py

  echo "Finished at $(date)."
  echo "Sleeping for 30s..."
  echo

  BACKOFF=0
  sleep 30
done
