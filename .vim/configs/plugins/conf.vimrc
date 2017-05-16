let s:CONF_DIRECTORY = expand('<sfile>:p:h')
let s:vim_configuration_files = [
\ 'vim-plug.vimrc',
\ 'youcompleteme.vimrc',
\ 'syntastic.vimrc',
\ 'nerdtree.vimrc',
\ 'diff.vimrc',
\ 'latex.vimrc',
\ 'wintabs.vimrc',
\ 'ultisnips.vimrc',
\ 'calendar.vimrc',
\ 'gitv.vimrc',
\ 'indentline.vimrc',
\ 'easygrep.vimrc',
\ 'vimfiler.vimrc',
\ 'vim-xkbswitch.vimrc',
\]

for file in s:vim_configuration_files
  execute('source ' . s:CONF_DIRECTORY . '/' . file)
endfor
