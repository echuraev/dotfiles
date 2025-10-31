if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '--background-index', '--header-insertion=iwyu', '--clang-tidy']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

if executable('ffi-navigator')
    " pip install --user ffi-navigator
    au User lsp_setup call lsp#register_server({
        \ 'name': 'ffi-navigator',
        \ 'cmd': {server_info->['python', '-m', 'ffi_navigator.langserver']},
        \ 'allowlist': ['python', 'cpp'],
        \ 'whitelist': ['c', 'cpp', 'python', 'py'],
        \ })
endif

setlocal omnifunc=lsp#complete
setlocal signcolumn=yes
if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

let g:lsp_insert_text_enabled = 1
let g:lsp_use_lua = has('nvim-0.4.0') || (has('lua') && has('patch-8.2.0775'))
let g:lsp_semantic_enabled = 1

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_virtual_text_enabled = 1
let g:lsp_diagnostics_virtual_text_prefix = " ‣ "
let g:lsp_diagnostics_virtual_text_align = "after"
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_signs_error = {'text': '✗'}
let g:lsp_diagnostics_signs_warning = {'text': '‼'}
let g:lsp_diagnostics_signs_hint = {'text': '!'}
let g:lsp_document_code_action_signs_hint = {'text': '‼'}
let g:lsp_show_workspace_edits = 1

autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
