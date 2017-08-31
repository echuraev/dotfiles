" OS detection {{{ "
let g:isWindows = 0
let g:isLinux = 0
let g:isMac = 0
let g:isAndroid = 0
if has('win32')
    let g:isWindows = 1
elseif has('unix')
    if system('uname -s') =~ 'Darwin'
        let g:isMac = 1
    elseif system('uname -o') =~ 'Android'
        let g:isAndroid = 1
    else
        let g:isLinux = 1
    endif
endif
" }}} OS detection "
" Set key function {{{ "
function! SetKey()
    let skey = inputsecret('Enter password: ')
    echo skey
    set key=skey
endfunction
command! SetKey execute 'call SetKey()'
" }}} Set key function "
