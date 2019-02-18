if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'priority': 10,
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
elseif executable('cquery')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'cquery',
                \ 'cmd': {server_info->['cquery']},
                \ 'priority': 10,
                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
                \ })
elseif executable('ccls')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'ccls',
                \ 'cmd': {server_info->['ccls']},
                \ 'priority': 10,
                \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
                \ 'initialization_options': { 'cacheDirectory': '/tmp/ccls/cache'  },
                \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
                \ })
endif

if executable('docker-langserver')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'docker-langserver',
                \ 'cmd': {server_info->[&shell, &shellcmdflag, 'docker-langserver --stdio']},
                \ 'whitelist': ['dockerfile'],
                \ })
endif

if executable('pyls')
    au User lsp_setup call lsp#register_server({
                \ 'name': 'pyls',
                \ 'cmd': {server_info->['pyls']},
                \ 'whitelist': ['python'],
                \ })
endif

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 5,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

" let g:asyncomplete_smart_completion = 1   " LUA is required
" let g:lsp_diagnostics_enabled = 0         " disable diagnostics support for ALE
let g:asyncomplete_remove_duplicates = 1
let g:lsp_signs_enabled = 1                 " enable signs
let g:lsp_diagnostics_echo_cursor = 1       " enable echo under cursor when in normal mode
let g:lsp_async_completion = 1

nmap <leader>fc :LspCodeAction<CR>
nmap <silent> <leader>g  :LspDeclaration<CR>
nmap <silent> <leader>gd :LspDefinition<CR>
nmap <silent> <leader>gi :LspImplementation<CR>
nmap <leader>gR :LspRename<CR>
