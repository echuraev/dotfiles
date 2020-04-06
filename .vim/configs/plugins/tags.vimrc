let g:gutentags_project_root = ['.git', '.local_vimrc', '.hg', '.svn']
let g:gutentags_add_default_project_roots  = 1
let g:gutentags_add_ctrlp_root_markers = 0

if !g:isWindows
    let g:gutentags_cache_dir = expand('~/.cache/vim/ctags')
    command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')
endif

let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_empty_buffer = 0

let g:gutentags_ctags_extra_args = [
    \ '--tag-relative=yes',
    \ '--fields=+ailmnS',
    \ ]

" let g:gutentags_ctags_exclude = [
"     \ '*.git', '*.svn', '*.hg',
"     \ 'build',
"     \ 'bin',
"     \ 'temp'
"     \ 'docs',
"     \ '*.md',
"     \ '*.json', '*.xml', '*.bin',
"     \ '*.pyc', '*.class',
"     \ '*.pdb',
"     \ 'tags*',
"     \ 'cscope*',
"     \ '*.exe', '*.dll',
"     \ '*.mp3', '*.ogg', '*.flac',
"     \ '*.bmp', '*.jpg', '*.gif', '*.png', '*.ico',
"     \ '*.so', '*.a',
"     \ '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2', '*.rar', '*.zip',
"     \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
"     \ ]
"
" let g:gutentags_modules = ['ctags', 'gtags_cscope']
