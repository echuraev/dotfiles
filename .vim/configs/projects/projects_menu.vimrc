let s:projectLocations={
    \ 'llvm'   :     '~/.vim/configs/projects/llvm/',
    \ 'opencl' :     '~/.vim/configs/projects/opencl/',
    \ 'providence' : '~/.vim/configs/projects/providence/',
\}

function! InitProject(type, init_function)
    let l:location = getcwd()
    while 1
        let l:choice = confirm("Do you like to create ".a:type." project in '".l:location."'?", "&y\n&n", 1)
        if l:choice != 1
            let l:location = input("Input project location: ", "", "dir")
        else
            break
        endif
    endwhile
    execute "call ".a:init_function."('".s:projectLocations[a:type]."', '".l:location."')"
    echo "Project ".a:type." was created in '".l:location."'!"
endfunction

function! CopyLocalVimrc(src, dest)
    silent execute "!cp -f ".a:src."/.local_vimrc ".a:dest
    redraw!
endfunction

function! CopyAllFiles(src, dest)
    silent execute "!cp -f ".a:src."/.* ".a:dest
    silent execute "!cp -f ".a:src."/* ".a:dest
    redraw!
endfunction

menu Projects.llvm              :call InitProject('llvm', 'CopyLocalVimrc')<CR>
menu Projects.opencl            :call InitProject('opencl', 'CopyLocalVimrc')<CR>
menu Projects.providence        :call InitProject('providence', 'CopyLocalVimrc')<CR>
