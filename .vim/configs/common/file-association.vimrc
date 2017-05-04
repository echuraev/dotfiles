augroup filetype
    au! BufNewFile,BufRead *.cls                  set filetype=tex
    au! BufRead,BufNewFile *.cl                   set filetype=opencl
    au! BufRead,BufNewFile *.ll                   set filetype=llvm
    au! BufRead,BufNewFile *.td                   set filetype=tablegen
    au! BufNewFile,BufRead .tmux.conf*,tmux.conf* set filetype=tmux
augroup END

