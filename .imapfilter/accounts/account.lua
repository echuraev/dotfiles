-- This is an example file
-- All files in this directory must be named the same like the accounts in
-- mbsyncrc were named.
-- This file should contain filter function. In this function should be
-- described all filters for this account.
-- This function should have three arguments:
-- 1. account - this is structure which returnes after IMAP {...}. See login
-- function.
-- 2. creds - structure for current account that returns from
-- get_from_mbsyncrc() function.
-- 3. dir_map - mapping of directories for current account. You can get it from
-- function get_dir_map_from_mbsyncrc(). It needs for search directory with
-- mails if it have different name as on the server e.g. on the server name is
-- in imap4-utf-7 encoding.

-- Below is an example of function for moving all letters that was addressed to
-- user to directory that named "To:" and this directory is a subfolder of
-- INBOX

function filters(account, creds, dir_map)
    -- Move all messages with me in to field to directory To:
    -- accounts.Work:create_mailbox('INBOX/To:')
    inbox = account.INBOX
    messages = inbox:contain_to(creds.username)
    messages:move_messages(account[get(dir_map, "INBOX/To:")])
end

