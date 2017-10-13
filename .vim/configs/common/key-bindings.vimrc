" Leader key mapping {{{ "
" Map leader key to custom
let mapleader=","
" \ works instead of ,
noremap \ ,
" }}} Leader key mapping "
" Movement {{{ "
inoremap <C-h> <LEFT>
imap <C-l> <RIGHT>
" }}} Movement "
" History key mapping {{{ "
" Trick from 'Practical VIM' filtering for history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" }}} History key mapping "
" Hot keys to change window size {{{ "
" Workaround for working with Meta key (Alt) {{{ "
"exec "set <M-h>=\eh"
"exec "set <M-l>=\el"
"exec "set <M-j>=\ej"
"exec "set <M-k>=\ek"
" }}} Workaround for working with Meta key (Alt) "
nmap <C-h> <c-w><
nmap <C-l> <c-w>>
nmap <C-j> <c-w>-
nmap <C-k> <c-w>+
" }}} Hot keys to change window size "
" Copy and paste mapping {{{ "
" Copy and paste to system buffer
nnoremap <C-y> "+Y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP

if has("gui_running")
    map  <silent>  <S-Insert>  "+p
    imap <silent>  <S-Insert>  <Esc>"+pa
endif

" 'global' buffer from file
vmap <leader>y :w! ~/.vim/.glob_buf<CR>
nmap <leader>y :.w! ~/.vim/.glob_buf<CR>
nmap <leader>p :r ~/.vim/.glob_buf<CR>
nmap <leader>P k:r ~/.vim/.glob_buf<CR>
" }}} Copy and paste mapping "
" Compile key mapping {{{ "
nnoremap <F5> :Dispatch<CR>
" }}} Compile key mapping "
" Project menu {{{ "
" For more information see: ~/.vim/configs/projects/projects_menu.vimrc
set wcm=<Tab>
nmap <leader>n :emenu Projects.<Tab>
" }}} Project menu "
" Reload vim configuration {{{ "
nnoremap <leader>rs :source ~/.vimrc<CR>
" }}} Reload vim configuration "
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%' " Get directory of current file
