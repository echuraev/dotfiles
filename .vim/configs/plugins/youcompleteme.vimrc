" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code completion plugin
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menu,menuone                                " Complete options (disable preview scratch window, longest removed to always show menu)
set pumheight=20                                            " Limit popup menu height
set concealcursor=inv                                       " Conceal in insert (i), normal (n) and visual (v) modes
set conceallevel=2                                          " Hide concealed text completely unless replacement character is defined
let g:clang_use_library = 1                                 " Use libclang directly
let g:clang_complete_auto = 1                               " Run autocompletion immediatelly after ->, ., ::
let g:clang_complete_copen = 1                              " Open quickfix window on error
let g:clang_periodic_quickfix = 0                           " Turn-off periodic updating of quickfix window (g:ClangUpdateQuickFix() does the same)
let g:clang_snippets = 1                                    " Enable function args autocompletion, template parameters, ...
let g:clang_snippets_engine = 'ultisnips'                   " Use UltiSnips engine for function args autocompletion (provides mechanism to jump over to the next argument)
"let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'

" Python complition
"let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_python_binary_path = 'python3'

" Goto definition
map <leader>g :YcmCompleter GoTo<CR>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
"set shortmess+=c

" http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
