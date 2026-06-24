call plug#begin('~/.vim/plugged')

" Search {{{ "
Plug 'wincent/ferret'                     " Fast search and replace
Plug 'google/vim-searchindex'             " Show number of found matches
" }}} Search "
" AI {{{ "
if has('nvim')
    Plug 'nvim-lua/plenary.nvim'
    Plug 'MunifTanjim/nui.nvim'
    " Claude Code CLI integration (same MCP/WebSocket protocol as the official
    " VS Code / JetBrains extensions: selection context, @-mentions, diffs)
    Plug 'coder/claudecode.nvim'
    " In-editor AI chat + inline assistant via the Anthropic API
    Plug 'olimorris/codecompanion.nvim'
    " Cursor-like AI sidebar with diff-apply. 'make' downloads a prebuilt
    " binary (no cargo needed); set BUILD_FROM_SOURCE=true to build it.
    Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }
endif
" }}} AI "
" Neovim native stack {{{ "
" Modern Lua plugins, loaded only under Neovim and configured in
" nvim-native.vimrc. The matching Vim plugins are gated behind !has('nvim')
" so plain Vim keeps working exactly as before.
if has('nvim')
    Plug 'nvim-tree/nvim-web-devicons'
    " Treesitter: syntax, indentation, folding and text objects
    Plug 'nvim-treesitter/nvim-treesitter', { 'branch': 'master', 'do': ':TSUpdate' }
    Plug 'nvim-treesitter/nvim-treesitter-textobjects', { 'branch': 'master' }
    " Native LSP + tool installer
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/mason.nvim'
    " Completion (prebuilt fuzzy binary ships with the tagged release)
    Plug 'saghen/blink.cmp', { 'tag': '*' }
    " Fuzzy finder with LSP pickers / live grep (fits the existing fzf workflow)
    Plug 'ibhagwan/fzf-lua'
    " Diagnostics / quickfix / references list
    Plug 'folke/trouble.nvim'
    " Git signs (replaces vim-gitgutter)
    Plug 'lewis6991/gitsigns.nvim'
    " Formatting: clang-format, ruff, stylua, ...
    Plug 'stevearc/conform.nvim'
    " Symbol outline (replaces tagbar)
    Plug 'stevearc/aerial.nvim'
    " Keybinding discovery
    Plug 'folke/which-key.nvim'
    " Fast motions (modern easymotion)
    Plug 'folke/flash.nvim'
endif
" }}} Neovim native stack "
" Programming {{{ "
" C++ {{{ "
" Code Completion {{{ "
" Vim uses the VimScript LSP stack; Neovim uses native LSP + blink.cmp
" (see the Neovim native stack block and nvim-native.vimrc).
if !has('nvim')
    Plug 'prabirshrestha/vim-lsp', {'do': 'pip install --user ffi-navigator'}
    Plug 'mattn/vim-lsp-settings'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
endif
" }}} Code Completion "
" Syntax highlighting {{{ "
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }   " C++ highlighting
" }}} Syntax highlighting "
" CMake support {{{ "
Plug 'ilyachur/cmake4vim'
" }}} CMake support "
" }}} C++ "
" Python {{{ "
Plug 'psf/black', { 'branch': 'stable' }
" }}} Python "
" C# {{{ "
" Syntax highlighting {{{ "
Plug 'OrangeT/vim-csharp', { 'for': 'cs' }                  " C# highlighting
" }}} Syntax highlighting "
" }}} C# "
" LaTeX {{{ "
if !g:isAndroid
    Plug 'lervag/vimtex'                   " Plugin for editing LaTeX files
endif
" }}} LaTeX "
" Markdown {{{ "
Plug 'plasticboy/vim-markdown'             " Common plugin for markdown
Plug 'iamcco/markdown-preview.vim'         " Markdown preview plugin
Plug 'mzlogin/vim-markdown-toc'            " Generate TOC in markdown
" }}} Markdown "
" OpenCL {{{ "
" Syntax highlighting {{{ "
Plug 'petRUShka/vim-opencl', { 'for': 'opencl' }            " OpenCL syntax highlight
" }}} Syntax highlighting "
" }}} OpenCL "
" UML {{{ "
" Syntax highlighting {{{ "
Plug 'aklt/plantuml-syntax', { 'for': 'plantuml' }
" }}} Syntax highlighting "
" }}} UML "
" Proto {{{ "
" Syntax highlighting {{{ "
Plug 'uarun/vim-protobuf', { 'for': 'proto' }               " Proto syntax highlight
" }}} Syntax highlighting "
" }}} Proto "
" VimL {{{ "
Plug 'junegunn/vader.vim', { 'on': 'Vader' }                " Testing framework for vimscript
" }}} VimL "
" Debugging {{{ "
if !g:isWindows && !g:isAndroid
    Plug 'puremourning/vimspector', { 'do': './install_gadget.py --all --disable-tcl --disable-go'  }
    "Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }       " Gdb, lldb wrapper for neovim
endif
" }}} Debugging "
" Json {{{ "
Plug 'elzr/vim-json', { 'for': 'json' }                   " Color highlighting for json
Plug 'tpope/vim-jdaddy', { 'for': 'json' }
" }}} Json "
" Code formatting {{{ "
Plug 'rhysd/vim-clang-format'                             " Format code with specific coding style
" }}} Code formatting "
" Folding {{{ "
if !has('nvim')
    Plug 'pseewald/vim-anyfold'                           " Fold code (Neovim uses Treesitter folding)
endif
" }}} Folding "
" Other {{{ "
Plug 'scrooloose/nerdcommenter'                         " Enable commentaries

if executable('ctags') || executable('cscope') || executable('gtags')
	Plug 'ludovicchabant/vim-gutentags'                 " Ctags support
endif
" }}} Other "
" }}} Programming "
" Fuzzy Finder {{{ "
" Plugin outside ~/.vim/plugged with post-update hook
" On windows download binaries from the github
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
" }}} Fuzzy Finder "
" Tmux {{{ "
if !g:isWindows
    " Text Completion {{{ "
    Plug 'wellle/tmux-complete.vim'                       " Add completion for text from tmux panel
    " }}} Text Completion "
    " Syntax highlight {{{ "
    Plug 'pearance/vim-tmux', { 'for': 'tmux' }                 " Tmux configuration highlight
    " }}} Syntax highlight "
endif
" }}} Tmux "
" Git {{{ "
Plug 'tpope/vim-fugitive'                 " Git plugin
if !has('nvim')
    Plug 'airblade/vim-gitgutter'         " Git diff in sign column (Neovim uses gitsigns)
endif
Plug 'tpope/vim-git'                      " git syntax highlight
Plug 'junegunn/gv.vim'                    " light git commits browser
Plug 'rhysd/committia.vim'                " extended commit message
Plug 'hotwatermorning/auto-git-diff'      " git diff for rebase interactive
" }}} Git "
" Project {{{ "
Plug 'tpope/vim-dispatch'                 " Project compiling
if !g:isWindows && !g:isAndroid
    Plug 'embear/vim-localvimrc'          " Local vimrc files for projects
    Plug 'editorconfig/editorconfig-vim'  " Editor configuration for a project
endif
" }}} Project "
" File Tree {{{ "
Plug 'tpope/vim-vinegar'              " vinegar.vim enhances netrw
Plug 'vifm/vifm.vim'                  " Integrate vifm to vim
" }}} File Tree "
" Text manipulation {{{ "
Plug 'wellle/targets.vim'             " Add various text objects to VIM
Plug 'mg979/vim-visual-multi'         " Plugin for multiple cursors
Plug 'machakann/vim-multiselect'      " A library plugin to handle multiple visual selections
Plug 'tmhedberg/matchit'              " Extend behavior of %
Plug 'tpope/vim-repeat'               " Extend behavior of .
Plug 'tpope/vim-surround'             " Work with surroundings in pairs.
Plug 'junegunn/vim-easy-align'        " Vim alignment plugin
" }}} Text manipulation "
" Common {{{ "
Plug 'mhinz/vim-startify'             " Nice start screen
if !g:isAndroid && !has('nvim')
    Plug 'dense-analysis/ale'         " Syntax checking (Neovim uses native LSP diagnostics)
endif
Plug 'will133/vim-dirdiff'            " Dir diff viewer
Plug 'cohama/lexima.vim'              " Add auto-pairs
Plug 'tpope/vim-unimpaired'           " Fast navigation
Plug 'majutsushi/tagbar'              " Tagbar
Plug 'easymotion/vim-easymotion'      " Easy motion in files
Plug 'farmergreg/vim-lastplace'       " Intelligently reopen files at your last edit position
Plug 'qpkorr/vim-renamer'             " Rename list of files
Plug 'mbbill/undotree'                " Visualize undo tree
Plug 'bogado/file-line'               " For open file:line
Plug 'romainl/vim-qf', { 'for': 'qf' } " Tame the quickfix window
" }}} Common "
" View {{{ "
Plug 'yggdroot/indentline'            " Displaying thin vertical lines at each indentation level
Plug 'ntpeters/vim-better-whitespace' " Highlight whitespaces
Plug 'chrisbra/Colorizer'             " A plugin to color colornames and codes
Plug 'sunaku/vim-hicterm'             " Highlights terminal color code numbers
Plug 'powerman/vim-plugin-AnsiEsc'    " Enable highlighting AnsiEsc in vim
Plug 'jacoborus/tender.vim'           " Color scheme
Plug 'machakann/vim-highlightedyank'  " Highlight yanked region
" }}} View "
" Other {{{ "
Plug 'itchyny/calendar.vim'           " Calendar in VIM
Plug 'echuraev/translate-shell.vim'   " Translate plugin
Plug 'rhysd/vim-grammarous'           " Spell checker
Plug 'ianding1/leetcode.vim'          " Leetcode plugin
" }}} Other "

call plug#end()

let g:plug_threads = 8
