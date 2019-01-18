#!/usr/bin/env python

from subprocess import Popen, PIPE
import os
import re
import sys
import tempfile
import mail2html

def trim_not_html(input):
    trimmed_lines = []
    keep_line = False
    for line in input.split('\n'):
        if line.find('<html ') == 0:
            keep_line = True
        if line.find('</html>') != -1:
            if keep_line is True:
                trimmed_lines.append(line)
            keep_line = False
        if keep_line is True:
            trimmed_lines.append(line)
    return '\n'.join(trimmed_lines)

def preview(message):
    trimmed = trim_not_html(message)
    fd, path = tempfile.mkstemp(suffix=".html")
    try:
        with os.fdopen(fd, 'w') as tmp:
            tmp.write(trimmed)
    except:
        raise Exception('Cannot create temporary file')
    p = Popen(['open', path], stdout=PIPE, stdin=PIPE, stderr=PIPE)
    _, err = p.communicate()
    if p.returncode != 0:
        raise Exception('open failed with code: {0}; msg: {1}'.format(p.returncode, err))

if __name__ == '__main__':
    message = sys.stdin.read()
    preview(mail2html.process_message(message))

