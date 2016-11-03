let g:VIM_ROOT_DIRECTORY = expand('<sfile>:p:h')
let g:vim_configuration_files = [
\ '.vim/configs/plugins/vim-plug.vimrc',
\ '.vim/configs/common/common.vimrc',
\ '.vim/configs/common/key-bindings.vimrc',
\ '.vim/configs/plugins/airline.vimrc',
\ '.vim/configs/plugins/syntastic.vimrc',
\ '.vim/configs/plugins/youcompleteme.vimrc',
\ '.vim/configs/plugins/nerdtree.vimrc',
\]

for file in g:vim_configuration_files
  execute('source ' . g:VIM_ROOT_DIRECTORY . '/' . file)
endfor

