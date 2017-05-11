" Filetype detection {{{ "
filetype plugin indent on
filetype plugin on
" }}} Filetype detection "
" Search {{{
set ignorecase                  " ignore register for search
set incsearch                   " momental search
set hls                         " highlight searsh
" }}} Search
" Tab size {{{
set ts=4
set expandtab
set shiftwidth=4
set cindent
" Python shiftwidth, tabstop, softtabstop {{{
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
" }}} Python shiftwidth, tabstop, softtabstop
" }}} Tab size
" View settings {{{ "
set rnu                      " Relative numbers
set nu                       " Show numbers
set ai                       " auto indent
set cursorline               " Highlight current line
set showcmd
set linebreak
set autoread
set synmaxcol=300            " Don't try to highlight long lines"
syntax enable
colorscheme xoria256 " jellybeans
set colorcolumn=80     " Set Color Column
"hi ColorColumn ctermbg=1 guibg='#800000'
if !has('win32')
    set term=screen-256color
    set list listchars=tab:▸\ ,trail:·,extends:»,precedes:«,nbsp:× " WS highlighting
endif
" Transparent background {{{ "
hi Normal ctermbg=none
hi LineNr ctermbg=none
hi SignColumn ctermbg=none
hi VertSplit ctermbg=none
hi NonText ctermbg=none
" }}} Transparent background "
" Diff Colors {{{ "
" DiffAdd     diff mode: Added line
" DiffChange  diff mode: Changed line
" DiffDelete  diff mode: Deleted line
" DiffText    diff mode: Changed text within a changed line
highlight DiffAdd    cterm=BOLD ctermfg=NONE ctermbg=22 gui=BOLD guifg=NONE guibg='#005f00'
highlight DiffDelete cterm=BOLD ctermfg=NONE ctermbg=52 gui=BOLD guifg=NONE guibg='#5f0000'
highlight DiffChange cterm=BOLD ctermfg=NONE ctermbg=23 gui=BOLD guifg=NONE guibg='#005f5f'
highlight DiffText   cterm=BOLD ctermfg=NONE ctermbg=53 gui=BOLD guifg=NONE guibg='#5f005f'
au VimEnter * if &diff | execute 'windo hi CursorLine ctermbg=none guibg=NONE cterm=none gui=none' | endif " No highlight for cursor line
" }}} Diff Colors "
" }}} View settings "
" Folding settings {{{ "
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
autocmd FileType vim set foldmethod=marker
autocmd FileType vim set foldenable
autocmd FileType vim set foldlevel=0
" }}} Folding settings "
" Mouse settings {{{ "
set mouse=a
" }}} Mouse settings "
" Find another vimrc {{{ "
set exrc
set secure
" }}} Find another vimrc "
" Backup and temporary files {{{ "
if !has('win32')
    set nobackup                            " Don't create files with backup copy (filename.txt~)
    silent !mkdir ~/.vim/swapfiles > /dev/null 2>&1
    set dir=~/.vim/swapfiles                " Directory for saving swp files
endif
set noswapfile                          " Don't create swap files
" }}} Backup and temporary files "
" Command line options {{{ "
set path+=**                            " Provides tab-completion for all file-related tasks
set wildmenu                            " cmd autocomplition
set wildmode=longest:list,full          " autocomplition like in bash
set history=5000
" }}} Command line options "
"set updatetime=100
" Diff settings {{{ "
au VimEnter * if &diff | execute 'windo set wrap' | endif " Wrap words if diff
" }}} Diff settings "
" Spell checking {{{ "
:set spell spelllang=ru,en         " Enable spell checking
" Run :set spell to download dictionaries
" }}} Spell checking "
