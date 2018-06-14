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
set colorcolumn=80     " Set Color Column
" Disable color column for some ft {{{ "
autocmd FileType conque_term setlocal colorcolumn=
autocmd FileType gitv setlocal colorcolumn=
autocmd FileType git setlocal colorcolumn=
autocmd FileType gitrebase setlocal colorcolumn=
autocmd FileType fugitiveblame setlocal colorcolumn=
autocmd FileType qf setlocal colorcolumn=
" }}} Disable color column for some ft "
if !g:isWindows
    set term=screen-256color
    if !g:isAndroid
        set list listchars=tab:▸\ ,trail:·,extends:»,precedes:«,nbsp:× " WS highlighting
        let &showbreak='↳ '                 " DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
    endif
    "highlight Comment cterm=italic gui=italic     " Italic comments in terminal
    set t_ZH=[3m
    set t_ZR=[23m
endif
autocmd VIMResized * execute "normal! \<c-w>="

set re=1                " force the old regex engine on any version newer (it helped to resolve performance with syntax highlighting)
set lazyredraw          " Don’t update screen during macro and script execution.
" }}} View settings "
" Folding settings {{{ "
set foldmethod=syntax   "fold based on syntax
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
" Show fold column in the left side of window
autocmd BufEnter,FocusGained,VimEnter,WinEnter * execute "set foldcolumn=3"
autocmd FocusLost,WinLeave * execute "set foldcolumn=0"

autocmd FileType vim set foldmethod=marker foldenable foldlevel=0
autocmd FileType sh set foldmethod=marker foldenable foldlevel=0
autocmd FileType zsh set foldmethod=marker foldenable foldlevel=0
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
if !g:isAndroid
    set spell spelllang=ru,en         " Enable spell checking
endif
" Disable spell checking for special ft {{{ "
autocmd FileType conque_term setlocal nospell
autocmd FileType gitv setlocal nospell
autocmd FileType GV setlocal nospell
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
