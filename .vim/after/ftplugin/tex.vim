setlocal errorformat=%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m
if filereadable('Makefile')
    setlocal makeprg=make
endif

nunmap <buffer> <F5>
nmap <silent> <buffer> <leader><F5> <Plug>Tex_FastEnvironmentInsert
