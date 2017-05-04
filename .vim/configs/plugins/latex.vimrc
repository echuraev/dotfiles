" Fix for using ctrl+j key
"imap <C-space> <Plug>IMAP_JumpForward
nnoremap <SID>I_won’t_ever_type_this <Plug>IMAP_JumpForward

" vim-latex configuration
let g:tex_flavor='latex'
" no symbol conversion
let g:tex_conceal = ""

"autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'okular'
