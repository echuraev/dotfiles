" vim swap header/source {{{ "
nmap <F2>  :A<CR>
" }}} vim swap header/source "
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
if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:patience
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
    let g:ferret_search_options = '--hidden'
endif

let g:FerretExecutableArguments = {
            \ 'rg': '--vimgrep --no-heading --no-config --max-columns 4096 --hidden'
            \ }

nmap <leader>ff <Plug>(FerretAck)
nmap <leader>fr <Plug>(FerretAcks)
nmap <silent> <leader>fw <Plug>(FerretAckWord)
" }}} ferret "
" VIFM {{{ "
let g:vifm_exec_args = '-c ":only"'
map <leader>fm :EditVifm<CR>
" }}} VIFM "
