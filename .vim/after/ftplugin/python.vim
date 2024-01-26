setlocal shiftwidth=4
set foldmethod=indent
setlocal tabstop=4
setlocal softtabstop=4


augroup whitespace
  au BufWinEnter *.py let w:m2=matchadd('WarningMsg', '\%>80v.\+', -1)
  au BufWinLeave *.py call clearmatches()
augroup END

compiler pyunit
setlocal makeprg=python3\ %
setlocal errorformat=

nmap <buffer> gs :10 split term://python3 %<cr>:startinsert<cr>
nmap <buffer> gS :10 split term://ipython --simple-prompt<cr>:startinsert<cr>
"nmap <buffer> gK :!nvim-keywordprg python <cword><cr>
nmap <buffer> <leader>dd :term python3 -m pdb %:p
nmap <buffer> <leader>r :term python3 %:p
nmap <buffer> <leader>dr :TermdebugCommand python3 %:p
nmap <buffer> <leader>db ^:startinsert<cr>__import__('pdb').set_trace()<cr>
nmap <buffer> <silent><localleader>? :<C-u>Cheatdebug<cr>

ia <buffer> pp print(f"DEBUG:")<Left><Left>
ia <buffer> bb breakpoint()<Esc>mb

highlight link myHighlight WarningMsg
match myHighlight /breakpoint()/

