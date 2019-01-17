#!/usr/bin/env python

import sys

if sys.argv < 2:
    print("One argument should be passed")
    exit(1)

def count_msgs(lines):
    msgs = 0
    for line in lines:
        nums = [int(s) for s in line.split() if s.isdigit()]
        msgs += nums[0]
    return msgs

filename = sys.argv[1]
master_lines = []
slave_lines = []
with open(filename, 'r') as f:
    for line in f:
        if line.find("master: ") == 0:
            master_lines.append(line)
        if line.find("slave: ") == 0:
            slave_lines.append(line)

master_msgs = count_msgs(master_lines)
slave_msgs = count_msgs(slave_lines)

msgs = (master_msgs - slave_msgs)
if msgs < 0:
    msgs = 0

exit(msgs)

