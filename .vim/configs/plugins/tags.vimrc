let g:gutentags_project_root = ['.git', '.local_vimrc', '.hg', '.svn']
let g:gutentags_add_default_project_roots  = 1
let g:gutentags_add_ctrlp_root_markers = 0

if !g:isWindows
    let g:gutentags_cache_dir = expand('~/.cache/vim/ctags')
    command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')
endif

let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_empty_buffer = 0

" Extra:  Specifies whether to include extra tag entries for certain kinds of information.
"
" q       Include an extra class-qualified tag entry for each tag which is a member of
"         a class (for languages for which this information is extracted; currently
"         C++, Eiffel, and Java). The actual form of the qualified tag depends upon
"         the language from which the tag was derived (using a form that is most
"         natural for how qualified calls are specified in the language). For C++, it
"         is in the form "class::member"; for Eiffel and Java, it is in the form
"         "class.member". This may allow easier location of a specific tags when
"         multiple occurrences of a tag name occur in the tag file. Note, however,
"         that this could potentially more than double the size of the tag file.
"
" f       Include an entry for the base file name of every source file (e.g.
"         "example.c"), which addresses the first line of the file.
"
" Fields: Specifies the available extension fields which are to be included in
"         the entries of the tag file
"
" a       Access (or export) of class members
" i       Inheritance information
" l       Language of source file containing tag
" m       Implementation information
" n       Line number of tag definition
" S       Signature of routine (e.g. prototype or parameter list)
let g:gutentags_ctags_extra_args = [
    \ '--tag-relative=yes',
    \ '--fields=+ailmnS',
    \ '--extra=+qf',
    \ '--c++-kinds=+p',
    \ '--exclude=*.pb',
    \ ]

" Find alternate
" Use --extra=+f for ctags
function! SwitchSource(splitType)
    let extMap = {
        \ 'cpp': ['hpp', 'h'],
        \ 'cxx': ['hpp', 'h'],
        \ 'c': ['hpp', 'h'],
        \ 'hpp': ['cpp', 'cxx', 'c'],
        \ 'h': ['cpp', 'cxx', 'c'],
    \ }
    let kinds = ['F']
    let fileName = expand('%:t:r')
    let fullFilePath = expand('%:p:r')
    let ext = expand('%:e')

    let openCommand = ':e'
    if (a:splitType == "h")
        let openCommand = ':split'
    elseif (a:splitType == "v")
        let openCommand = ':vsplit'
    elseif (a:splitType == "t")
        let openCommand = ':tabe'
    endif

    if has_key(extMap, ext)
        " First of all check local files
        for altExt in extMap[ext]
            let altFile = fullFilePath.".".altExt
            if filereadable(altFile)
                silent! execute openCommand." ".altFile
                return
            endif
        endfor
        for altExt in extMap[ext]
            let altFile = fileName.".".altExt
            for entry in taglist(altFile)
                if index(kinds, entry.kind) > -1
                    silent! execute openCommand." ".entry.filename
                    return
                endif
            endfor
        endfor
    endif
    echohl ErrorMsg |
                \ echomsg "Cannot find alternate file for: ".@% |
                \ echohl None
    return
endfunction

command! -nargs=0 A call SwitchSource("")
command! -nargs=0 AV call SwitchSource("v")
command! -nargs=0 AS call SwitchSource("h")
command! -nargs=0 AT call SwitchSource("t")

" let g:gutentags_ctags_exclude = [
"     \ '*.git', '*.svn', '*.hg',
"     \ 'build',
"     \ 'bin',
"     \ 'temp'
"     \ 'docs',
"     \ '*.md',
"     \ '*.json', '*.xml', '*.bin',
"     \ '*.pyc', '*.class',
"     \ '*.pdb',
"     \ 'tags*',
"     \ 'cscope*',
"     \ '*.exe', '*.dll',
"     \ '*.mp3', '*.ogg', '*.flac',
"     \ '*.bmp', '*.jpg', '*.gif', '*.png', '*.ico',
"     \ '*.so', '*.a',
"     \ '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2', '*.rar', '*.zip',
"     \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
"     \ ]
"
" let g:gutentags_modules = ['ctags', 'gtags_cscope']
