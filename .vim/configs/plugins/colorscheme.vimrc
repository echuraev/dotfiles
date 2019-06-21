syntax enable
" for vim 7
set t_Co=256

silent! colorscheme tender
hi ColorColumn ctermbg=1 guibg='#800000'
hi Underlined term=underline cterm=underline gui=underline ctermfg=81 guifg=#73cef4
hi Visual  term=reverse ctermbg=240 guibg=#585858
hi VisualNOS term=bold,underline ctermbg=60 guibg=#5f5f87
"IncSearch      xxx term=reverse ctermfg=235 ctermbg=15 guifg=#282828 guibg=#ffffff
"Search         xxx term=reverse cterm=bold,underline ctermfg=15 gui=bold,underline guifg=#ffffff
hi Search       term=reverse cterm=bold,underline gui=bold,underline ctermfg=0 guifg=#000000 ctermbg=149 guibg=#afdf5f
hi TagbarSignature  cterm=bold ctermfg=185 gui=bold guifg=#c9d05c
"hi VisualNOS term=bold,underline ctermbg=0 guibg=#040404
" Transparent background {{{ "
if exists('g:vimconf_transparent_bg') && g:vimconf_transparent_bg == 1
    hi Normal ctermbg=none
    hi LineNr ctermbg=none
    hi SignColumn ctermbg=none
    hi VertSplit ctermbg=none
    hi NonText ctermbg=none
    hi FoldColumn ctermbg=none
endif
" }}} Transparent background "
" Diff Colors {{{ "
" DiffAdd     diff mode: Added line
" DiffChange  diff mode: Changed line
" DiffDelete  diff mode: Deleted line
" DiffText    diff mode: Changed text within a changed line
highlight DiffAdd    cterm=BOLD ctermfg=NONE ctermbg=65 gui=BOLD guifg=NONE guibg=#5f875f
highlight DiffDelete cterm=BOLD ctermfg=NONE ctermbg=131 gui=BOLD guifg=NONE guibg=#af5f5f
highlight DiffChange cterm=BOLD ctermfg=NONE ctermbg=66 gui=BOLD guifg=NONE guibg=#5f8787
highlight DiffText   cterm=BOLD ctermfg=NONE ctermbg=53 gui=BOLD guifg=NONE guibg=#5f005f
"""au VimEnter * if &diff | execute 'windo hi CursorLine ctermbg=none guibg=NONE cterm=none gui=none' | endif " No highlight for cursor line
" }}} Diff Colors "

