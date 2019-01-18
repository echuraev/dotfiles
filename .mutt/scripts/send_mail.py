#!/usr/bin/env python

from subprocess import Popen, PIPE
import sys
import mail2html

MSMTP_PATH = '/usr/local/bin/msmtp'

def deliver(message):
    p = Popen([MSMTP_PATH] + sys.argv[1:], stdout=PIPE, stdin=PIPE, stderr=PIPE)
    _, err = p.communicate(input=message)
    if p.returncode != 0:
        raise Exception('msmtp failed with code: {0}; msg: {1}'.format(p.returncode, err))

if __name__ == '__main__':
    message = sys.stdin.read()
    deliver(mail2html.process_message(message))

