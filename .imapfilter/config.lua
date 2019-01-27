function trim_quotes(msg)
    msg = msg:gsub("^\"*(.-)\"*$", "%1")
    return msg
end

function get_from_mbsyncrc()
    dict_tmp = {
        account = '',
        server = '',
        username = '',
        password = '',
        ssl = ''
    }
    accounts_array = {}
    mbsyncrc = io.open(os.getenv('HOME') .. '/.mbsyncrc', "r")
    counter = 0
    if mbsyncrc then
        for line in mbsyncrc:lines() do
            s, e = string.find(line, "IMAPAccount ")
            if s == 1 then
                counter = counter + 1
                accounts_array[counter] = {}
                accounts_array[counter].account = trim_quotes(string.sub(line, e+1, -1))
            end
            s, e = string.find(line, "Host ")
            if s == 1 then
                accounts_array[counter].server = trim_quotes(string.sub(line, e+1, -1))
            end
            s, e = string.find(line, "User ")
            if s == 1 then
                accounts_array[counter].username = trim_quotes(string.sub(line, e+1, -1))
            end
            s, e = string.find(line, "PassCmd ")
            if s == 1 then
                passcmd = trim_quotes(string.sub(line, e+1, -1))
                _, accounts_array[counter].password = pipe_from(passcmd)
            end
            s, e = string.find(line, "SSLType ")
            if s == 1 then
                accounts_array[counter].ssl = trim_quotes(string.sub(line, e+1, -1))
            end
        end
    end

    return accounts_array
end

function login()
    accounts = {}
    creds = get_from_mbsyncrc()
    for i = 1, #creds do
        accounts[creds[i].account] = IMAP {
            server   = creds[i].server,
            username = creds[i].username,
            password = creds[i].password,
            ssl      = creds[i].ssl
        }
    end
    return accounts
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

login()

