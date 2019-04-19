call plug#begin('~/.vim/plugged')

" Programming {{{ "
" C++ {{{ "
" Code Completion {{{ "
if !g:isAndroid
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'prabirshrestha/asyncomplete-file.vim'
endif
" }}} Code Completion "
" Syntax highlighting {{{ "
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }   " C++ highlighting
" }}} Syntax highlighting "
" CMake support {{{ "
Plug 'ilyachur/cmake4vim'
" }}} CMake support "
" GTests {{{ "
Plug 'alepez/vim-gtest'             " Google tests
" }}} GTests "
" Common {{{ "
Plug 'kana/vim-altr'
" }}} Common "
" }}} C++ "
" C# {{{ "
" Code Completion {{{ "
if !g:isAndroid
    if !g:isWindows
        Plug 'OmniSharp/omnisharp-vim', { 'do': 'git submodule update --init --recursive && cd server && xbuild  /p:TargetFrameworkVersion=v4.5' }         " C# completion
    else
        " For enable msbuild add to path variable path to .NET framework. E.g.: C:\Windows\Microsoft.NET\Framework\v4.0.30319
        Plug 'OmniSharp/omnisharp-vim', { 'do': 'git submodule update --init --recursive && cd server && msbuild' }         " C# completion
    endif
endif
" }}} Code Completion "
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
" Proto {{{ "
" Syntax highlighting {{{ "
Plug 'uarun/vim-protobuf', { 'for': 'proto' }               " Proto syntax highlight
" }}} Syntax highlighting "
" }}} Proto "
" }}} OpenCL "
" VimL {{{ "
Plug 'junegunn/vader.vim'                  " Testing framework for vimscript
" }}} VimL "
" Debugging {{{ "
if !g:isWindows && !g:isAndroid
    Plug 'echuraev/Conque-GDB', { 'on': 'ConqueGdb' }         " Conque GDB
    Plug 'Shougo/vimproc.vim', { 'do' : 'make' }              " vim-vebugger is dependent on it
    Plug 'idanarye/vim-vebugger', { 'branch': 'develop' }     " lldb debugger
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
Plug 'pseewald/vim-anyfold'                               " Fold code
" }}} Folding "
" }}} Programming "
" Snippets {{{ "
" For working it is necessary to have python3 installed
" On Windows you have to have the same architecture (32 or 64 bits) versions of vim and python
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'   " Snippets.
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
" }}} Snippets "
" Fuzzy Finder {{{ "
" Plugin outside ~/.vim/plugged with post-update hook
" On windows download binaries from the github
if !g:isWindows
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
else
    Plug 'junegunn/fzf'
endif
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
Plug 'tpope/vim-fugitive'                " Git plugin
Plug 'lambdalisue/gina.vim'              " New git plugin
Plug 'airblade/vim-gitgutter'            " Extension for git
Plug 'gregsexton/gitv', {'on': ['Gitv']} " Gitk for vim
Plug 'tpope/vim-git'                     " git syntax highlight
Plug 'junegunn/gv.vim'                   " light git commits browser
Plug 'rhysd/committia.vim'               " extended commit message
" }}} Git "
" Search {{{ "
Plug 'osyo-manga/vim-over'            " Replace highlighter
Plug 'wincent/ferret'                 " Fast search and replace
Plug 'google/vim-searchindex'         " Show number of found matches
" }}} Search "
" Project {{{ "
Plug 'tpope/vim-dispatch'             " Project compiling
if !g:isWindows && !g:isAndroid
    Plug 'embear/vim-localvimrc'          " Local vimrc files for projects
    Plug 'editorconfig/editorconfig-vim'  " Editor configuration for a project
endif
" }}} Project "
" File Tree {{{ "
Plug 'scrooloose/nerdtree', { 'on':  'NERDTree' } | Plug 'Xuyuanp/nerdtree-git-plugin' " | Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }
Plug 'tpope/vim-vinegar'              " vinegar.vim enhances netrw
Plug 'francoiscabrol/ranger.vim'      " Integrate ranger file manager to vim
Plug 'vifm/vifm.vim'                  " Integrate vifm to vim
" }}} File Tree "
" Text manipulation {{{ "
Plug 'wellle/targets.vim'             " Add various text objects to VIM
Plug 'terryma/vim-multiple-cursors'   " Plugin for multiple cursors
Plug 'machakann/vim-multiselect'      " A library plugin to handle multiple visual selections
Plug 'tmhedberg/matchit'              " Extend behavior of %
Plug 'tpope/vim-repeat'               " Extend behavior of .
Plug 'tpope/vim-surround'             " Work with surroundings in pairs.
Plug 'junegunn/vim-easy-align'        " Vim alignment plugin
Plug 'godlygeek/tabular'              " Also alignment plugin
" }}} Text manipulation "
" Common {{{ "
if v:version > 704 || (v:version == 704 && has('patch248'))     " systemlist function was added in patch 248
    Plug 'chrisbra/vim-diff-enhanced' " Diff viewer
endif
Plug 'mhinz/vim-startify'             " Nice start screen
if !g:isAndroid
    Plug 'w0rp/ale'                   " Syntax checking plugin
endif
Plug 'will133/vim-dirdiff'            " Dir diff viewer
Plug 'cohama/lexima.vim'              " Add auto-pairs
Plug 'tpope/vim-unimpaired'           " Fast navigation
Plug 'majutsushi/tagbar'              " Tagbar
Plug 'easymotion/vim-easymotion'      " Easy motion in files
Plug 'dhruvasagar/vim-zoom'           " Zoom vim window like in tmux
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
Plug 'vim-scripts/xoria256.vim'       " Color scheme
Plug 'jacoborus/tender.vim'           " Color scheme "diff, links in vimwiki, selection
" }}} View "
" Other {{{ "
Plug 'itchyny/calendar.vim'           " Calendar in VIM
Plug 'vimwiki/vimwiki'                " Organize notes
Plug 'echuraev/translate-shell.vim'   " Translate plugin
Plug 'ledger/vim-ledger'              " Finance management
Plug 'rhysd/vim-grammarous'           " Spell checker
" }}} Other "

call plug#end()

let g:plug_threads = 8
