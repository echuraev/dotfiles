" Force Python version on Python2
" https://robertbasic.com/blog/force-python-version-in-vim/
if has('python3')
elseif has('python')
endif

if has('win32')
    set runtimepath+=~/.vim
endif

scriptencoding utf-8
set nocompatible
syntax enable
filetype plugin on

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
if filereadable($HOME."/.vimrc.local")
  execute('source '.$HOME.'/.vimrc.local')
endif
" Load VIM configs {{{ "
let g:VIM_ROOT_DIRECTORY = expand('<sfile>:p:h')

" First I have to initialize my key-bindings otherwise it will not working in plugins
let g:vim_configuration_files = [
\ '.vim/configs/projects/projects_menu.vimrc',
\ '.vim/configs/common/common-functions.vimrc',
\ '.vim/configs/plugins/conf.vimrc',
\ '.vim/configs/common/conf.vimrc',
\ '.vim/configs/key-bindings.vimrc',
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

