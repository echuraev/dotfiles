"let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'

" Python complition
"let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_python_binary_path = 'python3'

" Goto definition
map <leader>g :YcmCompleter GoTo<CR>
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
if exists('g:ycm_filetype_blacklist')
  call extend(g:ycm_filetype_blacklist, { 'ledger': 1 })
endif
