let g:calendar_first_day = "monday"
let g:calendar_time_zone = "+0300"           " Moscow time zone
let g:calendar_date_endian = "little"        " day/month/year
let g:calendar_date_month_name=1             " Name of month in text representation
let g:calendar_date_full_month_name=0        " Print full name of month
let g:calendar_week_number=1                 " Show the week numbers
" CalendarToggle function {{{ "
let s:calendarToggle = 0
let s:calendarBuf = -1
function! CalendarToggle()
    if s:calendarBuf > -1 && bufwinnr(s:calendarBuf) == -1
        let s:calendarToggle = 0
    endif
    if s:calendarToggle
        silent execute 'bd' s:calendarBuf
        let s:calendarToggle = 0
    else
        :Calendar -view=year -split=vertical -width=27
        let s:calendarToggle = 1
        let s:calendarBuf = bufnr("%")
    endif
endfunction

command! CalendarToggle execute 'call CalendarToggle()'
noremap <leader>c :CalendarToggle<CR>
" }}} CalendarToggle function "

