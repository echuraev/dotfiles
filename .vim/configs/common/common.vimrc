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
" --> Syntax highlighting
" syntax enable
" hi clear Normal
" set background=dark
" set t_Co=256
syntax enable
" set background=dark
colorscheme lucario 

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use


set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r   :e ++enc=koi8-r<CR>
menu Encoding.cp1251   :e ++enc=cp1251<CR>
menu Encoding.cp866    :e ++enc=cp866<CR>
menu Encoding.ucs-2le  :e ++enc=ucs-2le<CR>
menu Encoding.utf-8    :e ++enc=utf-8<CR>
map <F12> :emenu Encoding.<Tab>

" Mouse options
set mouse=a

set laststatus=2
set statusline=%f%m%r%h%w\ %y\ enc:%{&enc}\ fenc:%{&fenc}%={ch:%3b\ hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]


