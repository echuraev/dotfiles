dofile(os.getenv('HOME') .. '/.imapfilter/utils.lua')

function get_dir_map_from_mbsyncrc()
    accounts_dir_map = {}
    key = ''
    remote_store = ''
    slave_store = ''
    curr_master = ''
    curr_master_trans = ''
    mbsyncrc = io.open(os.getenv('HOME') .. '/.mbsyncrc', "r")
    if mbsyncrc then
        for line in mbsyncrc:lines() do
            s, e = string.find(line, "IMAPAccount ")
            if s == 1 then
                key = trim_quotes(string.sub(line, e+1, -1))
                accounts_dir_map[key] = {}
            end
            s, e = string.find(line, "IMAPStore ")
            if s == 1 then
                remote_store = trim_quotes(string.sub(line, e+1, -1))
            end
            s, e = string.find(line, "MaildirStore ")
            if s == 1 then
                slave_store = trim_quotes(string.sub(line, e+1, -1))
            end
            s, e = string.find(line, "#trans: Master :" .. remote_store .. ":", 1, true)
            if s == 1 then
                curr_master_trans = trim_quotes(string.sub(line, e+1, -1))
            end
            s, e = string.find(line, "Master :" .. remote_store .. ":", 1, true)
            if s == 1 then
                curr_master = trim_quotes(string.sub(line, e+1, -1))
            end
            s, e = string.find(line, "Slave :" .. slave_store .. ":", 1, true)
            if s == 1 then
                k = trim_quotes(string.sub(line, e+1, -1))
                if string.len(k) > 0 and string.len(curr_master) > 0 then
                    if string.len(curr_master_trans) > 0 then
                        curr_master = curr_master_trans
                    end
                    accounts_dir_map[key][k] = curr_master
                    curr_master_trans = ''
                end
            end
        end
    end

    return accounts_dir_map
end

function get_from_mbsyncrc()
    accounts_dict = {}
    mbsyncrc = io.open(os.getenv('HOME') .. '/.mbsyncrc', "r")
    key = ''
    if mbsyncrc then
        for line in mbsyncrc:lines() do
            s, e = string.find(line, "IMAPAccount ")
            if s == 1 then
                key = trim_quotes(string.sub(line, e+1, -1))
                accounts_dict[key] = {}
            end
            s, e = string.find(line, "Host ")
            if s == 1 then
                accounts_dict[key].server = trim_quotes(string.sub(line, e+1, -1))
            end
            s, e = string.find(line, "User ")
            if s == 1 then
                accounts_dict[key].username = trim_quotes(string.sub(line, e+1, -1))
            end
            s, e = string.find(line, "PassCmd ")
            if s == 1 then
                passcmd = trim_quotes(string.sub(line, e+1, -1))
                _, accounts_dict[key].password = pipe_from(passcmd)
            end
            s, e = string.find(line, "SSLType ")
            if s == 1 then
                accounts_dict[key].ssl = trim_quotes(string.sub(line, e+1, -1))
            end
        end
    end

    return accounts_dict
end

function get(dict, key)
    if dict[key] ~= nil then
        return dict[key]
    else
        return key
    end
end

function login(creds)
    accounts = {}
    for key, val in pairs(creds) do
        accounts[key] = IMAP {
            server   = val.server,
            username = val.username,
            password = val.password,
            ssl      = val.ssl
        }
    end
    return accounts
end

