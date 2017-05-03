" Common
set laststatus=2        " Always show statusline

" Status line view
let g:currentmode={
    \ 'n'  : 'N ',
    \ 'no' : 'N·Operator Pending ',
    \ 'v'  : 'V ',
    \ 'V'  : 'V·Line ',
    \ '' : 'V·Block',
    \ 's'  : 'Select ',
    \ 'S'  : 'S·Line ',
    \ '^S' : 'S·Block ',
    \ 'i'  : 'I ',
    \ 'R'  : 'R ',
    \ 'Rv' : 'V·Replace ',
    \ 'c'  : 'Command ',
    \ 'cv' : 'Vim Ex ',
    \ 'ce' : 'Ex ',
    \ 'r'  : 'Prompt ',
    \ 'rm' : 'More ',
    \ 'r?' : 'Confirm ',
    \ '!'  : 'Shell ',
    \ 't'  : 'Terminal ',
\}

" Default active colors
let defaultAccentColor=161
let colorsAndModes= {
    \ 'n'           : 28,
    \ 'i'           : 33,
    \ 'v'           : 127,
    \ 'V'           : 127,
    \ ''          : 127,
    \ 'R'           : 166,
    \ 'statBgFg'    : 15,
    \ 'statBgBg'    : 236,
    \ 'statModifFg' : 160,
\}
let defaultAccentColorGui='#d7005f'
let colorsAndModesGui= {
    \ 'n'           : '#008700',
    \ 'i'           : '#0087ff',
    \ 'v'           : '#af00af',
    \ 'V'           : '#af00af',
    \ ''          : '#af00af',
    \ 'R'           : '#d75f00',
    \ 'statBgFg'    : '#ffffff',
    \ 'statBgBg'    : '#303030',
    \ 'statModifFg' : '#d70000',
\}

" Default inactive colors
let defaultInactiveAccentColor=89
let inactiveColorsAndModes= {
    \ 'n'           : 22,
    \ 'i'           : 25,
    \ 'v'           : 53,
    \ 'V'           : 53,
    \ ''          : 53,
    \ 'R'           : 94,
    \ 'statBgFg'    : 244,
    \ 'statBgBg'    : 233,
    \ 'statModifFg' : 88,
\}
let defaultInactiveAccentColorGui='#87005f'
let inactiveColorsAndModesGui= {
    \ 'n'           : '#005f00',
    \ 'i'           : '#005faf',
    \ 'v'           : '#5f005f',
    \ 'V'           : '#5f005f',
    \ ''          : '#5f005f',
    \ 'R'           : '#875f00',
    \ 'statBgFg'    : '#808080',
    \ 'statBgBg'    : '#121212',
    \ 'statModifFg' : '#870000',
\}

function! ChangeAccentColor(active)
    let accentColor=get(g:colorsAndModes, mode(), g:defaultAccentColor)
    let accentColorGui=get(g:colorsAndModesGui, mode(), g:defaultAccentColorGui)
    let statBgFg = g:colorsAndModes['statBgFg']
    let statBgFgGui = g:colorsAndModesGui['statBgFg']
    let statBgBg = g:colorsAndModes['statBgBg']
    let statBgBgGui = g:colorsAndModesGui['statBgBg']
    let statModifFg = g:colorsAndModes['statModifFg']
    let statModifFgGui = g:colorsAndModesGui['statModifFg']

    if !a:active
        let accentColor=get(g:inactiveColorsAndModes, mode(), g:defaultInactiveAccentColor)
        let accentColorGui=get(g:inactiveColorsAndModesGui, mode(), g:defaultInactiveAccentColorGui)
        let statBgFg = g:inactiveColorsAndModes['statBgFg']
        let statBgFgGui = g:inactiveColorsAndModesGui['statBgFg']
        let statBgBg = g:inactiveColorsAndModes['statBgBg']
        let statBgBgGui = g:inactiveColorsAndModesGui['statBgBg']
        let statModifFg = g:inactiveColorsAndModes['statModifFg']
        let statModifFgGui = g:inactiveColorsAndModesGui['statModifFg']
    endif
    " Status line background
    execute 'hi statusBackground ctermfg='.statBgFg.' guifg='.statBgFgGui.' ctermbg='.statBgBg.' guibg='.statBgBgGui
    " Modified color
    execute 'hi statusModified ctermfg='.statModifFg.' guifg='.statModifFgGui.' ctermbg='.statBgBg.' guibg='.statBgBgGui
    " Workaround for mode background
    execute 'hi statusModeBackground ctermfg='.statBgFg.' ctermbg='.accentColor.' cterm=bold guifg=#'.statBgFgGui.' guibg='.accentColorGui.' gui=bold'

    execute 'hi TabLineSel ctermfg='.statBgFg.' cterm=bold ctermbg='.accentColor
    execute 'hi TabLine ctermbg=0 ctermfg='.accentColor
    execute 'hi CursorLineNr ctermfg='.accentColor.' guifg='.accentColorGui
    execute 'hi StatusLine ctermfg='.statBgFg.' ctermbg='.accentColor.' cterm=bold guifg=#'.statBgFgGui.' guibg='.accentColorGui.' gui=bold'
    execute 'hi StatusLineNC ctermfg='.statBgFg.' ctermbg='.accentColor.' cterm=NONE guifg=#'.statBgFgGui.' guibg='.accentColorGui.' gui=NONE'
    return ''
endfunction

" Find out current buffer's size and output it.
function! FileSize()
    let bytes = getfsize(expand('%:p'))
    if (bytes >= 1024)
        let kbytes = bytes / 1024
    endif
    if (exists('kbytes') && kbytes >= 1000)
        let mbytes = kbytes / 1000
    endif

    if bytes <= 0
        return '0'
    endif

    if (exists('mbytes'))
        return mbytes . 'MB '
    elseif (exists('kbytes'))
        return kbytes . 'KB '
    else
        return bytes . 'B '
    endif
endfunction

function! PasteMode()
    if &paste
        return ': PASTE '
    else
        return ''
endfunction

function! ReadOnly()
    if &readonly || !&modifiable
        if has('win32')
            return '[ro]'
        endif
        return ''
    else
        return ''
endfunction

function! GitInfo()
    let git = fugitive#head()
    if git != ''
        if has('win32')
            return 'git:'.fugitive#head()
        endif
        return ' '.fugitive#head()
    else
        return ''
endfunction

function! StatusLine(winnum)
    let active = a:winnum == winnr()
    let statLine  = ""
    let statLine .= "%{ChangeAccentColor(".active.")}"                          " Changing the statusline color
    let statLine .= "%#statusModeBackground# %{toupper(g:currentmode[mode()])}" " Current mode
    let statLine .= "%{PasteMode()}"
    let statLine .= "%#statusBackground# [%n]"                                  " buffernr
    let statLine .= "%#statusBackground# %{GitInfo()}"                          " Git Branch name
    let statLine .= "%#statusBackground# %<%f"                                  " File name
    let statLine .= "%#statusModified#%m"                                       " modified
    let statLine .= "%#statusBackground#%{ReadOnly()}%h%w "                     " File+path
    let statLine .= "%#warningmsg#"
    let statLine .= "%{SyntasticStatuslineFlag()}"                              " Syntastic errors
    let statLine .= "%#statusBackground#"
    let statLine .= "%#statusBackground# %="                                    " Space
    let statLine .= "%#statusBackground# %y "                                   " FileType
    let statLine .= "%#statusBackground# %{(&fenc!=''?&fenc:&enc)} [%{&ff}]"    " Encoding & Fileformat
    let statLine .= "%#statusBackground# %-3(%{FileSize()}%)"                   " File size
    let statLine .= "%#statusModeBackground# %3p%% line: %2l/%L, col: %3c "     " Rownumber/total (%)
    return statLine
endfunction

function! s:RefreshStatusLine()
    for nr in range(1, winnr('$'))
        call setwinvar(nr, '&statusline', '%!StatusLine('.nr.')')
    endfor
endfunction

augroup status
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * call <SID>RefreshStatusLine()
augroup END

" Speed up the redraw
"au InsertEnter * call ChangeAccentColor()
"au InsertChange * call ChangeAccentColor()
"au InsertLeave * call ChangeAccentColor()
"au CursorHold * let &ro = &ro

