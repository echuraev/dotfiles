" vim-altr {{{ "
command! A  call altr#forward()
nmap <F2>  <Plug>(altr-forward)
nmap <S-F2>  <Plug>(altr-back)
" }}} vim-altr "
" auto-pairs {{{ "
let g:AutoPairsMapCh=0
" }}} auto-pairs "
" Conque-gdb {{{ "
let g:ConqueGdb_Leader = '\'
let g:ConqueGdb_BreakEnabledSymbol = ''
let g:ConqueGdb_BreakDisabledSymbol = '⭘'
let g:ConqueGdb_SaveHistory = 1
" }}} Conque-gdb "
" diff mode {{{ "
if exists("*systemlist")
  if &diff
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
  endif
endif
" }}} diff mode "
" Gitv {{{ "
let g:Gitv_OpenHorizontal = 1
let g:Gitv_DoNotMapCtrlKey = 1
" }}} Gitv "
" IndentLine {{{ "
let g:indentLine_fileTypeExclude=['calendar', 'startify']
let g:indentLine_bufNameExclude=['calendar', 'startify']
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
let g:vim_json_syntax_conceal = 0
let g:indentLine_concealcursor=""
" }}} IndentLine "
" Latex {{{ "
let g:vimtex_fold_enabled=1
set conceallevel=0
let g:tex_conceal = ''
" }}} Latex "
" vim-localvimrc {{{ "
let g:localvimrc_name = ['.local_vimrc', '.lvimrc']
let g:localvimrc_sandbox = 0
let g:localvimrc_whitelist=[$HOME]
" }}} vim-localvimrc "
" Ranger {{{ "
let g:ranger_map_keys = 0
map <leader>r :Ranger<CR>
" }}} Ranger "
" Startify {{{ "
let g:startify_bookmarks = [ {'p': '~/.vim/configs/plugins/vim-plug.vimrc'} ]
let g:startify_change_to_dir = 0
" }}} Startify "
" zoom.vim {{{ "
nmap <C-W>z <Plug>(zoom-toggle)
" }}} zoom.vim "
" ferret {{{ "
let g:ferret_search_options = ''
if executable('rg')
    let g:ferret_search_options = '--vimgrep --smart-case --hidden'
endif

nnoremap <silent> <leader>ff :exe "Ack ".input("Search: ", "", "shellcmd")." ".g:ferret_search_options<CR>
nnoremap <silent> <leader>fw :exe "Ack ".input("Search: ", expand("<cword>"), "shellcmd")." ".g:ferret_search_options<CR>
" }}} ferret "
