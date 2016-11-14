" Search
set ignorecase " ignore register for search
set incsearch " momental search
set hls " highlight searsh

" tab size
set ts=4
set expandtab
set shiftwidth=4
set cindent

" View settings
set rnu                      " Relative numbers
set nu                       " Show numbers
set ai                       " auto indent
set showcmd
set linebreak
set autoread
syntax enable
colorscheme xoria256
set term=screen-256color
set colorcolumn=120     " Set Color Column
set list listchars=tab:▸\ ,trail:·,extends:»,precedes:«,nbsp:× " WS highlighting
" Transparent background
hi Normal ctermbg=none
hi LineNr ctermbg=none
hi SignColumn ctermbg=none
hi VertSplit ctermbg=none
hi NonText ctermbg=none

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Mouse options
set mouse=a

" filetype detection
filetype plugin indent on

set laststatus=2
set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ fenc:%{&fenc}%={ch:%3b\ hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]

" Find another vimrc
set exrc
set secure

" Backup and temporary files
set nobackup                            " Don't create files with backup copy (filename.txt~)
set dir=~/.vim/swapfiles                " Directory for saving swp files

" Command line
set wildmenu                            " cmd autocomplition
set wildmode=longest:list,full          " autocomplition like in bash

