" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code completion plugin
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set complete-=t                                             " Do not search tag files when auto-completing
set complete-=i                                             " Do not search include files when auto-completing
set completeopt=menu,menuone                                " Complete options (disable preview scratch window, longest removed to aways show menu)
set pumheight=20                                            " Limit popup menu height
set concealcursor=inv                                       " Conceal in insert (i), normal (n) and visual (v) modes
set conceallevel=2                                          " Hide concealed text completely unless replacement character is defined
let g:clang_use_library = 1                                 " Use libclang directly
"let g:clang_library_path = g:libclang_location              " Path to the libclang on the system
let g:clang_complete_auto = 1                               " Run autocompletion immediatelly after ->, ., ::
let g:clang_complete_copen = 1                              " Open quickfix window on error
let g:clang_periodic_quickfix = 0                           " Turn-off periodic updating of quickfix window (g:ClangUpdateQuickFix() does the same)
let g:clang_snippets = 1                                    " Enable function args autocompletion, template parameters, ...
"let g:clang_snippets_engine = 'ultisnips'                   " Use UltiSnips engine for function args autocompletion (provides mechanism to jump over to the next argument)
let g:clang_snippets_engine = 'clang_complete'             " Use clang_complete engine for function args autocompletion
let g:clang_conceal_snippets = 1                            " clang_complete engine related setting
"let g:clang_trailing_placeholder = 1                       " clang_complete engine related setting
"let g:clang_hl_errors = 0                                  " Turn-off error highlighting
"let g:clang_complete_patterns = 1                          " (Does not work for me) Turn-on autocompletion for language constructs (i.e. loops)
"let g:clang_complete_macros = 1
"let g:clang_user_options='|| exit 0'                       " Avoid freezing on offending code
"let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'

" Python complition
let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_python_binary_path = 'python'

" Goto definition with F3
map <leader>] :YcmCompleter GoTo<CR>

"set shortmess+=c

" http://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
