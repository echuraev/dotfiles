au! BufRead,BufNewFile *.cl set filetype=opencl
augroup filetypedetect
    au BufNewFile,BufRead .tmux.conf*,tmux.conf* set ft=tmux
augroup END
