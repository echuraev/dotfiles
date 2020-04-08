let g:coc_global_extensions = [
    \ 'coc-clangd',
    \ 'coc-dictionary',
    \ 'coc-json',
    \ 'coc-lists',
    \ 'coc-python',
    \ 'coc-snippets',
    \ 'coc-tag',
    \ 'coc-vimlsp',
    \ 'coc-vimtex',
    \ 'coc-yaml',
    \ 'coc-yank',
    \]

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Snippet help functions {{{ "
" Getting comments format {{{ "
"https://github.com/honza/vim-snippets/blob/efecc996d48ca4a2df835ebfe4c72724238fabd4/pythonx/vimsnippets.py
function! s:parse_comments(comments)
    let comments_list = split(a:comments, ",")
    let ret = []
    for i in range(1, len(comments_list))
        let [flags, text] = split(comments_list[i-1], ':', 1)

        echomsg flags
        if len(flags) == 0
            call add(ret, ["OTHER", text, text, text, ""])
        elseif flags =~ '^s[1-9]\+$' " exclude s0
            let ctriple = ["TRIPLE"]
            let indent = ""

            let l = len(flags)
            if flags[l - 1] =~ '\d'
                let indent = repeat(" ", flags[l - 1])
            endif
            call add(ctriple, text)

            let i = i + 1
            let [flags, text] = split(comments_list[i-1], ':', 1)
            if flags[0] !~ 'm'
                continue
            endif
            call add(ctriple, text)

            let i = i + 1
            let [flags, text] = split(comments_list[i-1], ':', 1)
            if flags[0] !~ 'e'
                continue
            endif
            call add(ctriple, text)
            call add(ctriple, indent)

            call add(ret, ctriple)
        elseif flags == "b"
            if len(text) == 1
                call insert(ret, ["SINGLE_CHAR", text, text, text, ""], 0)
            endif
        endif
    endfor
    return ret
endfunction

function! GetCommentFormat()
    " Returns a 4-element tuple (first_line, middle_lines, end_line, indent)
    " representing the comment format for the current file.
    "
    " It first looks at the 'commentstring', if that ends with %s, it uses
    " that.  Otherwise it parses '&comments' and prefers single character
    " comment markers if there are any.
    if &commentstring =~ "^.*\%s$"
        let c = substitute(&commentstring, '%s', '', '')
        return [c, c, c, ""]
    endif

    let comments = s:parse_comments(&comments)
    for c in comments
        if c[0] =~ "SINGLE_SHAR"
            return c[1:]
        endif
    endfor
    return comments[0][1:]
endfunction

function! GetFoldmarker()
    return split(&foldmarker, ",")
endfunction
" }}} Getting comments format "
" Get filename {{{ "
" https://github.com/honza/vim-snippets/blob/62f46770378ab899f40c334de264ccd64dc2db57/autoload/vim_snippets.vim
function! Filename(...)
    let filename = expand('%:t:r')
    if filename == '' | return a:0 == 2 ? a:2 : '' | endif
    return !a:0 || a:1 == '' ? filename : substitute(a:1, '$1', filename, 'g')
endfunction
" }}} Get filename "
" }}} Snippet help functions "
