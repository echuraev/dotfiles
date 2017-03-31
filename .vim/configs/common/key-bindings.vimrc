" Map leader key to custom
:let mapleader=","

" Hot keys to change window size
" Workaround for working with Meta key (Alt)
"exec "set <M-h>=\eh"
"exec "set <M-l>=\el"
"exec "set <M-j>=\ej"
"exec "set <M-k>=\ek"
map <C-h> <c-w><
map <C-l> <c-w>>
map <C-j> <c-w>-
map <C-k> <c-w>+

" Copy and paste to system buffer
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

" Build 
nnoremap <F5> :make!<cr>
