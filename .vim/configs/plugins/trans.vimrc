let g:trans_default_direction = ":ru"
let g:trans_directions_list = [
    \['en', 'ru'],
    \['ru', 'en'],
    \['en', 'de'],
    \['de', 'ru'],
    \['en', 'ru', 'de'],
    \['', 'ru'],
    \['', ''],
\]
" TODO: Add tests cases on the last two items

inoremap <silent> <leader>t <ESC>:Trans<CR>
nnoremap <silent> <leader>t :Trans<CR>
vnoremap <silent> <leader>t :TransVisual<CR>

