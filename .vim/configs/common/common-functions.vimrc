" OS detection {{{ "
function! CheckOS()
    if has('win32')
        return 'Windows'
    elseif has('unix')
        if system('uname -s') =~ 'Darwin'
            return 'Darwin'
        else
            return 'Linux'
        endif
    endif
    return 'Unknown'
endfunction
" }}} OS detection "

