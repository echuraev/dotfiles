let s:top_directory = $HOME."/.vim/configs/projects"
let s:menu_file_name = '.menu.vimrc'
let s:menu_file_path = s:top_directory.'/'.s:menu_file_name
" Get projects list {{{ "
let s:directories = split(globpath(s:top_directory, "/[a-zA-Z0-9]*/"), "\n")
let s:names = map(split(globpath(s:top_directory, "/[a-zA-Z0-9]*/"), "\n"), 'fnamemodify(v:val, ":h:t")')

" The structure is:
" {
" key: [directory, init_function_callback]
" }
"
" If you need to change init_function_callback then you just need to change
" this value for specific key.
" Possible values: 'CopyLocalVimrc' and 'CopyAllFiles'
let s:projectLocations = {}
let i = 0
while i < len(s:directories)
    let key = s:names[i]
    let val = s:directories[i]
    let callback = 'CopyLocalVimrc'
    let s:projectLocations[key] = [val, callback]
    let i = i + 1
endwhile
" }}} Get projects list "

function! InitProject(type)
    let l:location = getcwd()
    while 1
        let l:choice = confirm("Do you like to create ".a:type." project in '".l:location."'?", "&y\n&n", 1)
        if l:choice != 1
            let l:location = input("Input project location: ", "", "dir")
        else
            break
        endif
    endwhile
    execute "call ".s:projectLocations[a:type][1]."('".s:projectLocations[a:type][0]."', '".l:location."')"
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

function! GenerateProjectMenuFile()
    if filereadable(s:menu_file_path)
        return
    endif
    execute 'redir >> '.s:menu_file_path
    for name in s:names
        silent echo 'menu Projects.'.name.'  :call InitProject('.name.')<CR>'
    endfor
    silent! redir END
endfunction
"menu Projects.cpp               :call InitProject('cpp', 'CopyLocalVimrc')<CR>
"menu Projects.providence        :call InitProject('providence', 'CopyLocalVimrc')<CR>

call GenerateProjectMenuFile()

if filereadable(s:menu_file_path)
    execute('source '.s:menu_file_path)
endif
