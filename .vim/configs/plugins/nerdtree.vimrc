"-------------------------------------------------------------------------------------------------------
" Module for plugins downloading
"-------------------------------------------------------------------------------------------------------

let g:NERDTreeMouseMode = 2                                 " Single-click to expand the directory, double-click to open the file
let g:NERDTreeShowHidden = 1                                " Show hidden files
" For double mouse click and for avoid tab duplicating I should change .vim/bundle/nerdtree/autoload/nerdtree/ui_glue.vim:
" -  call NERDTreeAddKeyMap({ 'key': '<2-LeftMouse>', 'scope': "FileNode", 'callback': s."activateFileNode" })
" +  call NERDTreeAddKeyMap({ 'key': '<2-LeftMouse>', 'scope': "FileNode", 'callback': 'NERDTreeMyOpenInTab', 'override': 1 })
" +  call NERDTreeAddKeyMap({ 'key': '<Enter>', 'scope': "FileNode", 'callback': 'NERDTreeMyOpenInTab', 'override': 1 })
" +  call NERDTreeAddKeyMap({ 'key': 't', 'scope': "FileNode", 'callback': 'NERDTreeMyOpenInTab', 'override': 1 })

" NERDTree tabs
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_autofind=1
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_autofind=1

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

