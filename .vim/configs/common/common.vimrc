" Search
set ignorecase " ignore register for search
set incsearch " momental search
set hls " highlight searsh

" tab size
set ts=2
set expandtab
set shiftwidth=2
set cindent

" View settings
set rnu
set nu
set ai
set showcmd
set linebreak
set autoread
syntax enable
colorscheme xoria256
set term=screen-256color
set colorcolumn=120

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


