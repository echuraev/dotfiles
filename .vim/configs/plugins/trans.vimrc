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
let g:trans_save_history = 2
let g:trans_history_file = '~/translate-shell.vim_history/trans_history.csv'
let g:trans_close_window_after_saving = 1
let g:trans_save_only_unique = 2
let g:trans_history_format = '%s;%t;%as;%at'
let g:trans_save_raw_history = 1
let g:trans_save_audio = 1
let g:trans_ignore_audio_for_langs = ['ru']

inoremap <silent> <leader>t <ESC>:Trans<CR>
nnoremap <silent> <leader>t :Trans<CR>
vnoremap <silent> <leader>t :TransVisual<CR>

