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

let defaultAccentColor=161
let colorsAndModes= {
  \ 'n' : 28,
  \ 'i' : 33,
  \ 'v' : 127,
  \ 'V' : 127,
  \ '': 127,
  \ 'R' : 166,
\}
let defaultAccentColorGui='#d7005f'
let colorsAndModesGui= {
  \ 'n' : '#008700',
  \ 'i' : '#0087ff',
  \ 'v' : '#af00af',
  \ 'V' : '#af00af',
  \ '': '#af00af',
  \ 'R' : '#d75f00',
\}
function! ChangeAccentColor()
  let accentColor=get(g:colorsAndModes, mode(), g:defaultAccentColor)
  let accentColorGui=get(g:colorsAndModesGui, mode(), g:defaultAccentColorGui)
  " Status line background
  execute 'hi statusBackground ctermfg=15 guifg=#ffffff ctermbg=236 guibg=#303030'
  " Modified color
  execute 'hi statusModified ctermfg=160 guifg=#d70000 ctermbg=236 guibg=#303030'
  execute 'hi TabLineSel ctermfg=15 cterm=bold ctermbg='.accentColor
  execute 'hi TabLine ctermbg=0 ctermfg='.accentColor
  execute 'hi CursorLineNr ctermfg='.accentColor.' guifg='.accentColorGui
  execute 'hi StatusLine ctermfg=15 ctermbg='.accentColor.' cterm=bold guifg=#ffffff guibg='.accentColorGui.' gui=bold'
  execute 'hi StatusLineNC ctermfg=15 ctermbg='.accentColor.' cterm=NONE guifg=#ffffff guibg='.accentColorGui.' gui=NONE'
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

set laststatus=2        " Always show statusline
"set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ fenc:%{&fenc}%=col:%2c\ line:%2l/%L\ [%2p%%]

set statusline=
set statusline+=%{ChangeAccentColor()}                                   " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}                   " Current mode
set statusline+=%{PasteMode()}
set statusline+=%#statusBackground#\ [%n]                                " buffernr
set statusline+=%#statusBackground#\ %{GitInfo()}                        " Git Branch name
set statusline+=%#statusBackground#\ %<%f                                " File name
set statusline+=%#statusModified#\%m                                     " modified
set statusline+=%#statusBackground#%{ReadOnly()}%h%w\                    " File+path
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}                             " Syntastic errors
set statusline+=%#statusBackground#
set statusline+=%#statusBackground#\ %=                                  " Space
set statusline+=%#statusBackground#\ %y\                                 " FileType
set statusline+=%#statusBackground#\ %{(&fenc!=''?&fenc:&enc)}\ [%{&ff}] " Encoding & Fileformat
set statusline+=%#statusBackground#\ %-3(%{FileSize()}%)                 " File size
set statusline+=%0*\ %3p%%\ line:\ %2l/%L,\ col:\ %3c\                   " Rownumber/total (%)

" Speed up the redraw
"au InsertEnter * call ChangeAccentColor()
"au InsertChange * call ChangeAccentColor()
"au InsertLeave * call ChangeAccentColor()
"au CursorHold * let &ro = &ro

