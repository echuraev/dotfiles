" Next line is fix for Windows but it brake colors in linux
" TODO: Fix it.
" set runtimepath=~/.vim

let g:VIM_ROOT_DIRECTORY = expand('<sfile>:p:h')
let g:vim_configuration_files = [
\ '.vim/configs/plugins/conf.vimrc',
\ '.vim/configs/common/conf.vimrc',
\]

for file in g:vim_configuration_files
  execute('source ' . g:VIM_ROOT_DIRECTORY . '/' . file)
endfor

