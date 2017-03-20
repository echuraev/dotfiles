let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

" Map leader key to custom
:let mapleader=","

" Hot keys to change window size
map <m-h> <c-w><
map <m-l> <c-w>>
map <m-j> <c-w>-
map <m-k> <c-w>+

" Copy and paste to system buffer
nnoremap <C-y> "+y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

" Build 
nnoremap <F5> :make!<cr>
