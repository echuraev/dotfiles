set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Dedicated Python 3 provider venv (pynvim), independent of conda envs so it
" never breaks when switching/removing them. Created by bootstrap.sh. Must be
" set before plugins load so vimspector & co. see has('python3') == 1.
let s:nvim_python = expand('~/.local/share/nvim-venv/bin/python')
if filereadable(s:nvim_python)
    let g:python3_host_prog = s:nvim_python
endif

source ~/.vimrc

