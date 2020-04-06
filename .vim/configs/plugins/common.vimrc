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
" Startify {{{ "
let g:startify_bookmarks = [ {'p': '~/.vim/configs/plugins/vim-plug.vimrc'} ]
let g:startify_change_to_dir = 0
" }}} Startify "
" ferret {{{ "
let g:ferret_search_options = ''
if executable('rg')
    let g:ferret_search_options = '--hidden'
endif

let g:FerretExecutableArguments = {
            \ 'rg': '--vimgrep --no-heading --no-config --max-columns 4096 --hidden'
            \ }
" }}} ferret "
" VIFM {{{ "
let g:vifm_exec_args = '-c ":only"'
" }}} VIFM "
" Multiple-cursors {{{ "
" Disable coc in order to avoid messages with timeout
function! Multiple_cursors_before()
    if exists('g:did_coc_loaded')
        exe 'CocDisable'
    endif
endfunction

function! Multiple_cursors_after()
    if exists('g:did_coc_loaded')
        exe 'CocEnable'
    endif
endfunction
" }}} Multiple-cursors "
" vim-cpp-enhanced-highlight {{{ "
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
"let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1
" }}} vim-cpp-enhanced-highlight "
