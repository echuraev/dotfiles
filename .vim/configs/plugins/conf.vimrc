let s:CONF_DIRECTORY = expand('<sfile>:p:h')
let s:vim_configuration_files = [
\ 'vim-plug.vimrc',
\ 'ale.vimrc',
\ 'anyfold.vimrc',
\ 'calendar.vimrc',
\ 'colorscheme.vimrc',
\ 'common.vimrc',
\ 'fzf.vimrc',
\ 'nerdtree.vimrc',
\ 'python-mode.vimrc',
\ 'trans.vimrc',
\ 'ultisnips.vimrc',
\ 'vim-cpp-enhanced-highlight.vimrc',
\ 'vimwiki.vimrc',
\ 'youcompleteme.vimrc',
\ 'gtest.vimrc',
\]

for file in s:vim_configuration_files
  execute('source ' . s:CONF_DIRECTORY . '/' . file)
endfor
