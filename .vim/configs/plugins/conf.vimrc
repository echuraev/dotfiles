let s:CONF_DIRECTORY = expand('<sfile>:p:h')
let s:vim_configuration_files = [
\ 'vim-plug.vimrc',
\ 'ale.vimrc',
\ 'anyfold.vimrc',
\ 'calendar.vimrc',
\ 'colorscheme.vimrc',
\ 'common.vimrc',
\ 'fzf.vimrc',
\ 'trans.vimrc',
\ 'lsp.vimrc',
\ 'tags.vimrc',
\]

for file in s:vim_configuration_files
  execute('source ' . s:CONF_DIRECTORY . '/' . file)
endfor
