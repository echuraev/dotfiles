if has('win32')
    set runtimepath+=~/.vim
endif

set nocompatible
syntax enable
filetype plugin on

" Determine VIM configuration {{{ "
" Enabled different configuration
" personalConfig helps to set some parameters (e.g. sync with google calendar)
" only on personal machine.
" extendedConfig enable some parameters that could be disabled by default.
" If you want to use personal or extended configurations, create file
" .personalConfig or .extendedConfig in your home directory.
let g:personalConfig = 0
if filereadable($HOME."/.personalConfig")
    let g:personalConfig = 1
endif
let g:extendedConfig = 0
if filereadable($HOME."/.extendedConfig")
    let g:extendedConfig = 1
endif
" }}} Determine VIM configuration "
" Vim Profiling {{{ "
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
" }}} Vim Profiling "
" Load VIM configs {{{ "
let g:VIM_ROOT_DIRECTORY = expand('<sfile>:p:h')

" First I have to initialize my key-bindings otherwise it will not working in plugins
let g:vim_configuration_files = [
\ '.vim/configs/common/key-bindings.vimrc',
\ '.vim/configs/plugins/conf.vimrc',
\ '.vim/configs/common/conf.vimrc',
\]

for file in g:vim_configuration_files
  execute('source ' . g:VIM_ROOT_DIRECTORY . '/' . file)
endfor
" }}} Load VIM configs "
" Display VIM start time {{{ "
if has('vim_starting') && has('reltime')
    let g:startuptime = reltime()
    augroup vimrc-startuptime
        autocmd! VimEnter * let g:startuptime = reltime(g:startuptime)
                    \ | redraw
                    \ | echomsg 'startuptime: ' . reltimestr(g:startuptime)
    augroup END
endif
" }}} Display VIM start time "

