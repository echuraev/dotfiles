" Common
set laststatus=2        " Always show statusline

" Status line modes {{{ "
let g:currentmode={
    \ 'n'  : 'N',
    \ 'no' : 'N·Operator Pending',
    \ 'v'  : 'V',
    \ 'V'  : 'V·Line',
    \ '' : 'V·Bloc',
    \ 's'  : 'Select',
    \ 'S'  : 'S·Line',
    \ '' : 'S·Block',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'Rv' : 'V·Replace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal',
\}
" }}} Status line modes "
" Default active colors {{{ "
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
" }}} Default active colors "
" Default inactive colors {{{ "
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
" }}} Default inactive colors "
" Status line color function {{{ "
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
    execute 'hi statusModeBackground ctermfg='.statBgFg.' ctermbg='.accentColor.' cterm=bold guifg='.statBgFgGui.' guibg='.accentColorGui.' gui=bold'

    execute 'hi TabLineSel ctermfg='.statBgFg.' cterm=bold ctermbg='.accentColor
    execute 'hi TabLine ctermbg=0 ctermfg='.accentColor
    execute 'hi CursorLineNr ctermfg='.accentColor.' guifg='.accentColorGui
    execute 'hi StatusLine ctermfg='.statBgFg.' ctermbg='.accentColor.' cterm=bold guifg='.statBgFgGui.' guibg='.accentColorGui.' gui=bold'
    execute 'hi StatusLineNC ctermfg='.statBgFg.' ctermbg='.accentColor.' cterm=NONE guifg='.statBgFgGui.' guibg='.accentColorGui.' gui=NONE'
    return ''
endfunction
" }}} Status line color function "
" Common functions {{{ "
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
        return mbytes . 'MB'
    elseif (exists('kbytes'))
        return kbytes . 'KB'
    else
        return bytes . 'B'
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
        if g:isWindows
            return '[ro]'
        endif
        return ''
    else
        return ''
endfunction

function! GitInfo()
    if !exists('*fugitive#head')
        return ''
    endif
    let git = fugitive#head()
    if git != ''
        if g:isWindows
            return 'git:'.fugitive#head()
        endif
        return ' '.fugitive#head()
    else
        return ''
    endif
endfunction
" }}} Common functions "

function! StatusLine(winnum)
    let active = a:winnum == winnr()
    let statLine  = ""
    " Left {{{ "
    let statLine .= "%{ChangeAccentColor(".active.")}"                          " Changing the statusline color
    let statLine .= "%#statusModeBackground#"                                   " Switch to statusModeBackground hi group
    let statLine .= " "                                                         " Space
    let statLine .= "%{toupper(g:currentmode[mode()])}"                         " Current mode
    let statLine .= " "                                                         " Space
    if active
        let statLine .= "%{PasteMode()}"                                        " Show paste mode if enabled
    endif
    let statLine .= "%#statusBackground#"                                       " Switch to statusBackground hi group
    let statLine .= " "                                                         " Space
    let statLine .= "[%n]"                                                      " buffernr
    let statLine .= " "                                                         " Space
    if winwidth(a:winnum) > 80
        let statLine .= "%<%{GitInfo()}"                                        " Git Branch name
        let statLine .= " "                                                     " Space
    endif
    if !active
        let statLine .= "%<%t"                                                  " File name (only name)
    else
        let statLine .= "%<%f"                                                  " File name
    endif
    let statLine .= "%#statusModified#"                                         " Switch to statusModifien hi group
    let statLine .= "%m"                                                        " modified
    let statLine .= "%#statusBackground#"                                       " Switch to statusBackground hi group
    let statLine .= "%{ReadOnly()}%w"                                           " Is it read only file and preview windows flag [Preview]
    let statLine .= " "                                                         " Space
    if active && winwidth(a:winnum) > 80
        if exists('*SyntasticStatuslineFlag')
            let statLine .= "%#warningmsg#"                                     " Switch to warning hi group
            let statLine .= "%{SyntasticStatuslineFlag()}"                      " Syntastic errors
        endif
        let statLine .= "%#statusBackground#"                                   " Switch to statusBackground hi group
        let statLine .= " "                                                     " Space
    endif
    " }}} Left "
    let statLine .= "%="                                                        " Long space
    " Right {{{ "
    if winwidth(a:winnum) > 60
        let statLine .= "%y"                                                    " FileType
        let statLine .= " "                                                     " Space
    endif
    if active && winwidth(a:winnum) > 80
        let statLine .= "%{(&fenc!=''?&fenc:&enc)}"                             " Encoding
        let statLine .= " "                                                     " Space
        let statLine .= "[%{&ff}]"                                              " File format
        let statLine .= " "                                                     " Space
    endif
    let statLine .= "%(%{FileSize()}%)"                                         " File size
    let statLine .= " "                                                         " Space
    let statLine .= "%#statusModeBackground#"                                   " Switch to statusModeBackground hi group
    let statLine .= " "                                                         " Space
    if !active
        let statLine .= " "
    else
        let statLine .= "%3p%%"                                                 " Total (%)
        let statLine .= " "                                                     " Space
        let statLine .= "l: %2l/%L, c: %c"                                      " Line and column
        let statLine .= " "                                                     " Space
    endif
    " }}} Right "
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
