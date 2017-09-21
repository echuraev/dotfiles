" Filetype detection {{{ "
filetype plugin indent on
filetype plugin on
" }}} Filetype detection "
" Files Encryption {{{ "
if v:version > 704 || (v:version == 704 && has('patch399'))
    set cm=blowfish2
endif
" }}} Files Encryption "
" Search {{{
set ignorecase                  " ignore register for search
set incsearch                   " momental search
set hls                         " highlight searsh
" makes * and # work on visual mode too.
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
" }}} Search
" Tab size {{{
set tabstop=4
set expandtab
set shiftwidth=4
set cindent
set smartindent
" }}} Tab size
" View settings {{{ "
set rnu                      " Relative numbers
set nu                       " Show numbers
set cursorline               " Highlight current line
set showcmd
set linebreak
set autoread
set synmaxcol=300            " Don't try to highlight long lines"
set scrolloff=5              " Number of rows to show in window above and below cursor
syntax enable
silent! colorscheme xoria256 " jellybeans
set colorcolumn=80     " Set Color Column
" Disable color column for some ft {{{ "
autocmd FileType conque_term setlocal colorcolumn=
autocmd FileType gitv setlocal colorcolumn=
autocmd FileType git setlocal colorcolumn=
autocmd FileType gitrebase setlocal colorcolumn=
autocmd FileType fugitiveblame setlocal colorcolumn=
autocmd FileType qf setlocal colorcolumn=
" }}} Disable color column for some ft "
"hi ColorColumn ctermbg=1 guibg='#800000'
if !g:isWindows
    set term=screen-256color
    set list listchars=tab:▸\ ,trail:·,extends:»,precedes:«,nbsp:× " WS highlighting
endif
autocmd VIMResized * execute "normal! \<c-w>="
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
autocmd FileType vim set foldmethod=marker foldenable foldlevel=0
autocmd FileType sh set foldmethod=marker foldenable foldlevel=0
autocmd FileType lua set foldmethod=marker foldenable foldlevel=0
" }}} Folding settings "
" Mouse settings {{{ "
set mouse=a
" }}} Mouse settings "
" Find another vimrc {{{ "
set exrc
set secure
" }}} Find another vimrc "
" Backup and temporary files {{{ "
set nobackup                            " Don't create files with backup copy (filename.txt~)
set noswapfile                          " Don't create swap files
" }}} Backup and temporary files "
" Command line options {{{ "
set path+=**                            " Provides tab-completion for all file-related tasks
set wildmenu                            " cmd autocomplition
set wildmode=longest:list,full          " autocomplition like in bash
set history=5000
" }}} Command line options "
" Diff settings {{{ "
au VimEnter * if &diff | execute 'windo set wrap' | endif " Wrap words if diff
" }}} Diff settings "
" Spell checking {{{ "
set spell spelllang=ru,en         " Enable spell checking
" Disable spell checking for special ft {{{ "
autocmd FileType conque_term setlocal nospell
autocmd FileType gitv setlocal nospell
autocmd FileType git setlocal nospell
autocmd FileType gitrebase setlocal nospell
autocmd FileType fugitiveblame setlocal nospell
autocmd FileType qf setlocal nospell
autocmd FileType diff setlocal nospell
" }}} Disable spell checking for special ft "
" Run :set spell to download dictionaries
" }}} Spell checking "
" Other {{{ "
set backspace=2 " Fix backspace behavior on mac os
set hidden      " Can open new buffer even if current buffer has unsaved changes
set undofile    " Save undo's after file closes"
if !g:isWindows
    silent !mkdir ~/.vim/undodir > /dev/null 2>&1
    set undodir=~/.vim/undodir     " Directory for saving undo files
endif
" }}} Other "
