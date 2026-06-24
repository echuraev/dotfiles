" ALE is only used in plain Vim; Neovim relies on native LSP diagnostics.
if !has('nvim')
    let g:ale_sign_column_always = 1
    let g:ale_sign_error = '✗'
    let g:ale_sign_warning = '⚠'
    let g:ale_set_highlights = 1
endif

" Status line linter indicator. Uses ALE counts in Vim and native diagnostic
" counts in Neovim. (statusline.vimrc calls this unconditionally.)
function! LinterStatus() abort
    if exists('*ale#statusline#Count')
        let l:counts = ale#statusline#Count(bufnr(''))
        let l:all_errors = l:counts.error + l:counts.style_error
        let l:all_non_errors = l:counts.total - l:all_errors
        return l:counts.total == 0 ? '' : printf('[%dW %dE]', all_non_errors, all_errors)
    elseif has('nvim')
        let l:e = luaeval('#vim.diagnostic.get(0, {severity = vim.diagnostic.severity.ERROR})')
        let l:w = luaeval('#vim.diagnostic.get(0, {severity = vim.diagnostic.severity.WARN})')
        return (l:e + l:w) == 0 ? '' : printf('[%dW %dE]', l:w, l:e)
    endif
    return ''
endfunction
