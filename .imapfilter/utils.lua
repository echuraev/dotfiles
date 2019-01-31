local COLORS = {
    black = {fg = 30, bg = 40},
    red = {fg = 31, bg = 41},
    green = {fg = 32, bg = 42},
    yellow = {fg = 33, bg = 43},
    blue = {fg = 34, bg = 44},
    magenta = {fg = 35, bg = 45},
    cyan = {fg = 36, bg = 46},
    white = {fg = 37, bg = 47},
    reset = 0,
}

function trim_quotes(msg)
    msg = msg:gsub("^\"*(.-)\"*$", "%1")
    return msg
end

function file_exists(name)
    local f=io.open(name,"r")
    if f~=nil then
        io.close(f)
        return true
    else
        return false
    end
end

function escape(...)
    local arg = {...}
    local joined = table.concat(arg, ';')
    return '\027[' .. joined .. 'm'
end

function print_status(messages, description)
    label = #messages == 1 and 'message' or 'messages'
    bg = #messages > 0 and COLORS.green.bg or COLORS.yellow.bg
    print(
        escape(COLORS.black.fg, bg) ..
        description .. ': applied to ' .. #messages .. ' ' .. label ..
        escape(COLORS.reset)
    )
end
