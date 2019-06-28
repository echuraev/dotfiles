" If you use long lines, mutt will automatically switch to quoted-printable
" encoding. This will generally look better in most places that matter (eg.
" Gmail), where hard-wrapped email looks terrible and format=flowed is not
" supported.
"
" Needs to be in an "after" directory in order to beat Vim's runtime
" ("$VIMRUNTIME/ftplugin/mail.vim"), which sets it back to 72, but only if it
" was previously set to 0.
setlocal textwidth=0

" Completion functions {{{ "
" Look here:
" https://github.com/jamessan/etc-vim/blob/d3b970170304db5fb74a957d6674c88def1b61b1/.vim/ftplugin/mail_lbdbq.vim

" queries lbdb with a query string and return a list of pairs:
" [['full name', 'email'], ['full name', 'email'], ...]
function! s:LbdbQuery(qstring)
    if !executable("lbdbq")
        echoerr "Cannot find 'lbdbq' executable, please install it (usually, it comes with the 'lbdb' package)"
        return []
    endif
    let output = system("lbdbq '" . a:qstring . "'")
    let results = []

    if len(output) == 0
        return results
    endif

    for line in split(output, "\n")[1:] " skip first line (lbdbq summary)
        let fields = split(line, "\t")
        if len(fields) >= 2
            let results += [ [fields[1], fields[0]] ]
        endif
    endfor

    return results
endfunction

function! LBDBCompleteFn(findstart, base)
    if a:findstart
        " locate the start of the word
        let line = getline('.')
        let start = col('.') - 1

        while start > 0 && line[start - 1] =~ '[^:,]'
            let start -= 1
        endwhile

        while start < col('.') && line[start] =~ '[:, ]'
            let start += 1
        endwhile

        return start
    else
        let results = []
        let query = substitute(a:base, '"', '', 'g')
        let query = substitute(query, '\s*<.*>\s*', '', 'g')
        for m in s:LbdbQuery(query)
            call add(results, printf('"%s" <%s>', escape(m[0], '"'), m[1]))
        endfor
        return results
    endif
endfunction

set completefunc=LBDBCompleteFn
inoremap <Tab> <C-X><C-U>
inoremap <C-n> <C-X><C-U>
inoremap <C-p> <C-X><C-U>
" }}} Completion functions "
nnoremap <silent> <buffer> <F5> :w \| !cat % \| ~/.mutt/scripts/preview_mail.py<CR><CR>
