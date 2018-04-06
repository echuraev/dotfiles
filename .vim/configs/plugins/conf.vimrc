let s:CONF_DIRECTORY = expand('<sfile>:p:h')
let s:vim_configuration_files = [
\ 'vim-plug.vimrc',
\ 'colorscheme.vimrc',
\ 'youcompleteme.vimrc',
\ 'ale.vimrc',
\ 'anyfold.vimrc',
\ 'nerdtree.vimrc',
\ 'diff.vimrc',
\ 'markdown.vimrc',
\ 'latex.vimrc',
\ 'ultisnips.vimrc',
\ 'calendar.vimrc',
\ 'gitv.vimrc',
\ 'indentline.vimrc',
\ 'vimwiki.vimrc',
\ 'local_vimrc.vimrc',
\ 'fzf.vimrc',
\ 'startify.vimrc',
\ 'vim-cpp-enhanced-highlight.vimrc',
\ 'ack.vimrc',
\ 'auto-pairs.vimrc',
\ 'conquegdb.vimrc',
\ 'ranger.vimrc',
\ 'python-mode.vimrc',
\ 'trans.vimrc',
\]

for file in s:vim_configuration_files
  execute('source ' . s:CONF_DIRECTORY . '/' . file)
endfor
