" Found in this repo: https://github.com/sgeb/vim-diff-fold
" http://vimcasts.org/episodes/writing-a-custom-fold-expression/

"setlocal nomodeline formatoptions-=croq formatoptions+=tl
setlocal foldmethod=expr
setlocal foldexpr=DiffFoldLevel()
setlocal foldtext=DiffFoldText()
"setlocal foldcolumn=3

" Get fold level for diff mode
" Works with normal, context, unified, rcs, ed, subversion and git diffs.
" For rcs diffs, folds only files (rcs has no hunks in the common sense)
" foldlevel=1 ==> file
" foldlevel=2 ==> hunk
" context diffs need special treatment, as hunks are defined
" via context (after '***************'); checking for '*** '
" or ('--- ') only does not work, as the file lines have the
" same marker.
" Inspired by Tim Chase.
function! DiffFoldLevel()
    let l:line=getline(v:lnum)

    if l:line =~# '^\(diff\|Index\)'     " file
        return '>1'
    "elseif l:line =~# '^\(@@\|\d\)'  " hunk
    "    return '>2'
    elseif l:line =~# '^\*\*\* \d\+,\d\+ \*\*\*\*$' " context: file1
        return '>2'
    elseif l:line =~# '^--- \d\+,\d\+ ----$'     " context: file2
        return '>2'
    else
        return '='
    endif
endfunction

" Get some code of this function from fugitive#foldtext()
function! DiffFoldText()
  if getline(v:foldstart) =~# '^diff '
    let [add, remove] = [-1, -1]
    let filename = ''
    for lnum in range(v:foldstart, v:foldend)
      if filename ==# '' && getline(lnum) =~# '^[+-]\{3\} [abciow12]/'
        let filename = getline(lnum)[6:-1]
      endif
      if getline(lnum) =~# '^+'
        let add += 1
      elseif getline(lnum) =~# '^-'
        let remove += 1
      elseif getline(lnum) =~# '^Binary '
        let binary = 1
      endif
    endfor
    if filename ==# ''
      let filename = matchstr(getline(v:foldstart), '^diff .\{-\} [abciow12]/\zs.*\ze [abciow12]/')
    endif
    if filename ==# ''
      let filename = getline(v:foldstart)[5:-1]
    endif
    if exists('binary')
      return 'Binary: '.filename
    else
      return (add<10&&remove<100?' ':'') . add . '+ ' . (remove<10&&add<100?' ':'') . remove . '- ' . filename
    endif
  elseif getline(v:foldstart) =~# '^# .*:$'
    let lines = getline(v:foldstart, v:foldend)
    call filter(lines, 'v:val =~# "^#\t"')
    cal map(lines,'s:sub(v:val, "^#\t%(modified: +|renamed: +)=", "")')
    cal map(lines,'s:sub(v:val, "^([[:alpha:] ]+): +(.*)", "\\2 (\\1)")')
    return getline(v:foldstart).' '.join(lines, ', ')
  endif
  return foldtext()
endfunction
