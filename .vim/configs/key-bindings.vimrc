" Common {{{ "
" Leader key mapping {{{ "
" Map leader key to custom
let mapleader=","
" \ works instead of ,
noremap \ ,
" }}} Leader key mapping "
" Movement {{{ "
cnoremap <C-h> <LEFT>
cnoremap <C-l> <RIGHT>
" }}} Movement "
" History key mapping {{{ "
" Trick from 'Practical VIM' filtering for history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" }}} History key mapping "
" Hot keys to change window size {{{ "
nmap <C-h> <c-w><
nmap <C-l> <c-w>>
nmap <C-j> <c-w>-
nmap <C-k> <c-w>+
" }}} Hot keys to change window size "
" Copy and paste mapping {{{ "
" Copy and paste to system buffer
nnoremap <C-y> "+Y
vnoremap <C-y> "+y
nnoremap <C-p> "+gP
vnoremap <C-p> "+gP

if has("gui_running")
    map  <silent>  <S-Insert>  "+p
    imap <silent>  <S-Insert>  <Esc>"+pa
endif

" 'global' buffer from file
vmap <leader>y :w! ~/.vim/.glob_buf<CR>
nmap <leader>y :.w! ~/.vim/.glob_buf<CR>
nmap <leader>p :r ~/.vim/.glob_buf<CR>
nmap <leader>P k:r ~/.vim/.glob_buf<CR>
" }}} Copy and paste mapping "
" Compile key mapping {{{ "
nnoremap <F5> :Make<CR>
" }}} Compile key mapping "
" Project menu {{{ "
" For more information see: ~/.vim/configs/projects/projects_menu.vimrc
set wcm=<Tab>
nmap <leader>n :emenu Projects.<Tab>
" }}} Project menu "
" Reload vim configuration {{{ "
nnoremap <leader>rs :source ~/.vimrc<CR>
" }}} Reload vim configuration "
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%' " Get directory of current file
" }}} Common "
" Plugins {{{ "
" CalendarToggle {{{ "
noremap <leader>c :CalendarToggle<CR>
" }}} CalendarToggle "
" vim swap header/source {{{ "
nmap <F2>  :A<CR>
" }}} vim swap header/source "
" ferret {{{ "
nmap <leader>ff <Plug>(FerretAck)
nmap <leader>fr <Plug>(FerretAcks)
nmap <silent> <leader>fw <Plug>(FerretAckWord)
" }}} ferret "
" VIFM {{{ "
map <leader>fm :EditVifm<CR>
" }}} VIFM "
" FZF {{{ "
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>: :History:<CR>

nnoremap zf= :call FzfSpell()<CR>
" }}} FZF "
" LSP {{{ "
" KEY BINDINGS

" Use <c-space> for trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[d` and `]d` for navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <leader>g <Plug>(lsp-definition)
nmap <silent> <leader>gd <Plug>(lsp-type-definition)
nmap <silent> <leader>gi <Plug>(lsp-implementation)
nmap <silent> <leader>gr <Plug>(lsp-references)

" Use D for show documentation in preview window
nnoremap <silent> <leader>D :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(lsp-rename)
nmap <silent> <leader>qf <Plug>(lsp-code-action-float)
" }}} LSP "
" trans {{{ "
inoremap <silent> <leader>t <ESC>:Trans<CR>
nnoremap <silent> <leader>t :Trans<CR>
vnoremap <silent> <leader>t :Trans<CR>
nnoremap <silent> <leader>td :FZFTransSelectDirection<CR>
vnoremap <silent> <leader>td :FZFTransSelectDirection<CR>
nnoremap <silent> <leader>ti :FZFTransInteractive<CR>
" }}} trans "
" Debugger {{{ "
nnoremap <silent> <leader>dl   :call vimspector#Launch()<CR>
nnoremap <silent> <leader>dc   :call vimspector#Continue()<CR>
nnoremap <silent> <leader>dk   :call vimspector#Reset()<CR>
nnoremap <silent> <leader>dr   :call vimspector#Restart()<CR>
nnoremap <silent> <leader>dp   :call vimspector#Pause()<CR>
nnoremap <silent> <leader>db   :call vimspector#ToggleBreakpoint()<CR>
nnoremap <silent> <leader>df   :call vimspector#AddFunctionBreakpoint( expand( '<cexpr>'  )  )<CR>
nnoremap <silent> <leader>dn   :call vimspector#StepOver()<CR>
nnoremap <silent> <leader>ds   :call vimspector#StepInto()<CR>
nnoremap <silent> <leader>df   :call vimspector#StepOut()<CR>
" }}} Debugger "
" }}} Plugins "
