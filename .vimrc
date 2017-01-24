set nocompatible

syntax enable
filetype plugin on

" Vim Profiling
fun! ProfileStart()
    let profile_file = '/tmp/vim.'.getpid().'.profile.txt'
    echom "Profiling into" profile_file
    exec 'profile start '.profile_file
    profile! file **
    profile  func *
endfun
if get(g:, 'profile')
    call ProfileStart()
endif

" Vim start time
if has('vim_starting') && has('reltime')
    let g:startuptime = reltime()
    augroup vimrc-startuptime
        autocmd! VimEnter * let g:startuptime = reltime(g:startuptime)
                    \ | redraw
                    \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
    augroup END
endif

let g:VIM_ROOT_DIRECTORY = expand('<sfile>:p:h')
let g:vim_configuration_files = [
\ '.vim/configs/plugins/conf.vimrc',
\ '.vim/configs/common/conf.vimrc',
\]

for file in g:vim_configuration_files
  execute('source ' . g:VIM_ROOT_DIRECTORY . '/' . file)
endfor

