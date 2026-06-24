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

if has('nvim')
    " Native LSP (Neovim). References go through fzf-lua.
    nnoremap <silent> <leader>g  <cmd>lua vim.lsp.buf.definition()<cr>
    nnoremap <silent> <leader>gd <cmd>lua vim.lsp.buf.type_definition()<cr>
    nnoremap <silent> <leader>gi <cmd>lua vim.lsp.buf.implementation()<cr>
    nnoremap <silent> <leader>gr <cmd>lua require('fzf-lua').lsp_references()<cr>
    nnoremap <silent> <leader>D  <cmd>lua vim.lsp.buf.hover()<cr>
    nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<cr>
    nnoremap <silent> <leader>qf <cmd>lua vim.lsp.buf.code_action()<cr>
    nnoremap <silent> [d <cmd>lua vim.diagnostic.jump({count=-1, float=true})<cr>
    nnoremap <silent> ]d <cmd>lua vim.diagnostic.jump({count=1, float=true})<cr>
else
    " vim-lsp (Vim)
    nmap <silent> [d <Plug>(lsp-previous-diagnostic)
    nmap <silent> ]d <Plug>(lsp-next-diagnostic)
    nmap <silent> <leader>g  <Plug>(lsp-definition)
    nmap <silent> <leader>gd <Plug>(lsp-type-definition)
    nmap <silent> <leader>gi <Plug>(lsp-implementation)
    nmap <silent> <leader>gr <Plug>(lsp-references)
    nnoremap <silent> <leader>D :call <SID>show_documentation()<CR>
    nmap <leader>rn <Plug>(lsp-rename)
    nmap <silent> <leader>qf <Plug>(lsp-code-action-float)
endif
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
" Neovim plugins {{{ "
" Keybindings for the Neovim native stack (configured in nvim-native.vimrc and
" ai.vimrc). Avante's own keymaps are the exception: they are defined in its
" setup table in ai.vimrc, under the <leader>v prefix.
if has('nvim')
    " fzf-lua: grep & LSP pickers (<leader>s* to avoid the <leader>f maps)
    nnoremap <silent> <leader>sg <cmd>lua require('fzf-lua').live_grep()<cr>
    nnoremap <silent> <leader>sw <cmd>lua require('fzf-lua').grep_cword()<cr>
    nnoremap <silent> <leader>ss <cmd>lua require('fzf-lua').lsp_document_symbols()<cr>
    nnoremap <silent> <leader>sS <cmd>lua require('fzf-lua').lsp_live_workspace_symbols()<cr>
    nnoremap <silent> <leader>sd <cmd>lua require('fzf-lua').diagnostics_document()<cr>
    nnoremap <silent> <leader>sr <cmd>lua require('fzf-lua').resume()<cr>

    " trouble.nvim
    nnoremap <silent> <leader>xx <cmd>Trouble diagnostics toggle<cr>
    nnoremap <silent> <leader>xX <cmd>Trouble diagnostics toggle filter.buf=0<cr>
    nnoremap <silent> <leader>xs <cmd>Trouble symbols toggle<cr>
    nnoremap <silent> <leader>xq <cmd>Trouble qflist toggle<cr>

    " gitsigns (<leader>G* prefix; <leader>h is taken by :History)
    nnoremap <silent> ]c <cmd>lua require('gitsigns').nav_hunk('next')<cr>
    nnoremap <silent> [c <cmd>lua require('gitsigns').nav_hunk('prev')<cr>
    nnoremap <silent> <leader>Gs <cmd>lua require('gitsigns').stage_hunk()<cr>
    nnoremap <silent> <leader>Gr <cmd>lua require('gitsigns').reset_hunk()<cr>
    nnoremap <silent> <leader>Gp <cmd>lua require('gitsigns').preview_hunk()<cr>
    nnoremap <silent> <leader>Gb <cmd>lua require('gitsigns').blame_line({full=true})<cr>
    nnoremap <silent> <leader>Gd <cmd>lua require('gitsigns').diffthis()<cr>

    " conform: format buffer / selection
    nnoremap <silent> <leader>F <cmd>lua require('conform').format({async=true, lsp_format='fallback'})<cr>
    xnoremap <silent> <leader>F <cmd>lua require('conform').format({async=true, lsp_format='fallback'})<cr>

    " aerial: symbol outline
    nnoremap <silent> <leader>o <cmd>AerialToggle!<cr>

    " flash: s = jump, S = treesitter select (n, o; visual left for surround)
    nnoremap <silent> s <cmd>lua require('flash').jump()<cr>
    onoremap <silent> s <cmd>lua require('flash').jump()<cr>
    nnoremap <silent> S <cmd>lua require('flash').treesitter()<cr>
    onoremap <silent> S <cmd>lua require('flash').treesitter()<cr>

    " Leave terminal-mode (e.g. the Claude Code terminal) without moving window
    tnoremap <C-w>t <C-\><C-n>

    " claudecode.nvim : Claude Code CLI
    nnoremap <silent> <leader>ac <cmd>ClaudeCode<cr>
    nnoremap <silent> <leader>af <cmd>ClaudeCodeFocus<cr>
    nnoremap <silent> <leader>aC <cmd>ClaudeCode --continue<cr>
    nnoremap <silent> <leader>ar <cmd>ClaudeCode --resume<cr>
    nnoremap <silent> <leader>ab <cmd>ClaudeCodeAdd %<cr>
    xnoremap <silent> <leader>as <cmd>ClaudeCodeSend<cr>

    " codecompanion.nvim : chat + inline (Anthropic API)
    nnoremap <silent> <leader>ap <cmd>CodeCompanionActions<cr>
    xnoremap <silent> <leader>ap <cmd>CodeCompanionActions<cr>
    nnoremap <silent> <leader>ax <cmd>CodeCompanionChat Toggle<cr>
    xnoremap <silent> <leader>ax <cmd>CodeCompanionChat Toggle<cr>
    xnoremap <silent> <leader>ai <cmd>CodeCompanion<cr>
endif
" }}} Neovim plugins "
" }}} Plugins "
