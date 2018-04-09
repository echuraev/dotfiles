syntax enable
" for vim 7
set t_Co=256

silent! colorscheme tender
hi ColorColumn ctermbg=1 guibg='#800000'
hi Underlined term=underline cterm=underline gui=underline ctermfg=81 guifg=#73cef4
hi Visual  term=reverse ctermbg=240 guibg=#585858
hi VisualNOS term=bold,underline ctermbg=60 guibg=#5f5f87
"hi VisualNOS term=bold,underline ctermbg=0 guibg=#040404
" Transparent background {{{ "
"""hi Normal ctermbg=none
"""hi LineNr ctermbg=none
"""hi SignColumn ctermbg=none
"""hi VertSplit ctermbg=none
"""hi NonText ctermbg=none
"""hi FoldColumn ctermbg=none
" }}} Transparent background "
" Diff Colors {{{ "
" DiffAdd     diff mode: Added line
" DiffChange  diff mode: Changed line
" DiffDelete  diff mode: Deleted line
" DiffText    diff mode: Changed text within a changed line
"""highlight DiffAdd    cterm=BOLD ctermfg=NONE ctermbg=22 gui=BOLD guifg=NONE guibg='#005f00'
"""highlight DiffDelete cterm=BOLD ctermfg=NONE ctermbg=52 gui=BOLD guifg=NONE guibg='#5f0000'
"""highlight DiffChange cterm=BOLD ctermfg=NONE ctermbg=23 gui=BOLD guifg=NONE guibg='#005f5f'
"""highlight DiffText   cterm=BOLD ctermfg=NONE ctermbg=53 gui=BOLD guifg=NONE guibg='#5f005f'
"""au VimEnter * if &diff | execute 'windo hi CursorLine ctermbg=none guibg=NONE cterm=none gui=none' | endif " No highlight for cursor line
" }}} Diff Colors "

