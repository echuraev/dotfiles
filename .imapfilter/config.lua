dofile(os.getenv('HOME') .. '/.imapfilter/common.lua')

function common_filters(account, creds, dir_map)
    print(">>> Before filters Common " .. creds.username)

    -- Github rule
    mailbox_name = 'Github'
    --account:create_mailbox(mailbox_name)
    messages = account[get(dir_map, 'Inbox')]:contain_from("github.com")
    print_status(messages, 'Inbox -> ' .. mailbox_name)
    messages:move_messages(account[get(dir_map, mailbox_name)])


    -- Travis CI builds rule
    mailbox_name = 'Travis CI Builds'
    --account:create_mailbox(mailbox_name)
    messages = account[get(dir_map, 'Inbox')]:contain_from("builds@travis-ci.com") +
                account[get(dir_map, 'Inbox')]:contain_from("builds@travis-ci.org")
    print_status(messages, 'Inbox -> ' .. mailbox_name)
    messages:move_messages(account[get(dir_map, mailbox_name)])

    print(">>> After filters Common " .. creds.username)
end

-- Will specify a timeout for imapfilter to wait for the IMAP server response,
-- if you have huge mailboxes OR if you’re planning to use the special “All
-- mail” folder in Gmail, it’s a good idea to have a big timeout as operations
-- may take a while.
options.timeout = 1200

-- According to the IMAP specification, when trying to write a message to a
-- non-existent mailbox, the server must send a hint to the client, whether it
-- should create the mailbox and try again or not. However some IMAP servers
-- don't follow the specification and don't send the correct response code to
-- the client. By enabling this option the client tries to create the mailbox,
-- despite of the server's response.
options.create = true

-- By enabling this option new mailboxes that were automatically created, get
-- also subscribed; they are set active in order for IMAP clients to recognize
-- them
options.subscribe = true

creds = get_from_mbsyncrc()
accounts = login(creds)
dir_map = get_dir_map_from_mbsyncrc()

-- get directory name implement function
for key, acc in pairs(accounts) do
    common_filters(acc, creds[key], dir_map[key])

    ---- Load account specific settings
    file_name = os.getenv('HOME') .. '/.imapfilter/accounts/' .. key .. '.lua'
    if file_exists(file_name) then
        dofile(file_name)
        filters(acc, creds[key], dir_map[key])
    end
end

