" Disable coc in order to avoid messages with timeout
function! Multiple_cursors_before()
    if exists('g:did_coc_loaded')
        exe 'CocDisable'
    endif
endfunction

function! Multiple_cursors_after()
    if exists('g:did_coc_loaded')
        exe 'CocEnable'
    endif
endfunction
