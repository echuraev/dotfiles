let g:trans_default_direction = ":ru"
let g:trans_directions_list = [
    \['en', 'ru'],
    \['ru', 'en'],
    \['de', 'ru'],
    \['ru', 'de'],
    \['en', 'ru', 'de'],
    \['', 'ru'],
\]
let g:trans_join_lines = 1

inoremap <silent> <leader>t <ESC>:Trans<CR>
nnoremap <silent> <leader>t :Trans<CR>
vnoremap <silent> <leader>t :TransVisual<CR>

