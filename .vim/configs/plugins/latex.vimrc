au BufNewFile,BufRead *.cls set filetype=tex

" vim-latex configuration
let g:tex_flavor='latex'
" no symbol conversion
let g:tex_conceal = ""

"autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'okular'
