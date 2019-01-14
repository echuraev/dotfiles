#!/usr/bin/env python

import os

PRIORITY = {
    "+INBOX":   0,
    "+Starred": 1,
    "+Sent":    2,
    "+Drafts":  3,
    "+Archive": 4,
    "+Trash":   5,
    "+Spam":    6,
    "+Search":  99,
}

MAIL_DIR = os.getenv('HOME') + '/.mail'
MUTT_FILE = os.getenv('HOME') + '/.mutt/config/mailboxes.mutt'

#mailboxes = [f for f in os.listdir(MAIL_DIR) if os.path.isdir(os.path.join(MAIL_DIR, f))]
accounts = [f for f in os.listdir(MAIL_DIR) if os.path.isdir(os.path.join(MAIL_DIR, f))]
mailboxes = []
for acc in accounts:
    mailboxes.append(acc)
    account_dir = os.path.join(MAIL_DIR, acc)
    m = [acc + "/" + f for f in os.listdir(account_dir) if os.path.isdir(os.path.join(account_dir, f))]
    mailboxes.extend(m)

for i in range(len(mailboxes)):
    mailboxes[i] = "\"+" + mailboxes[i] + "\""

# TODO: add sort of mailboxes based on priority

with open(MUTT_FILE, 'w') as f:
    f.write("mailboxes " + ' '.join(mailboxes))

