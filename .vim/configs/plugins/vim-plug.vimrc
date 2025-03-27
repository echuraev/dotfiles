call plug#begin('~/.vim/plugged')

" Search {{{ "
Plug 'wincent/ferret'                     " Fast search and replace
Plug 'google/vim-searchindex'             " Show number of found matches
" }}} Search "
" Programming {{{ "
" C++ {{{ "
" Code Completion {{{ "
Plug 'prabirshrestha/vim-lsp', {'do': 'pip install --user ffi-navigator'}
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
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
Plug 'pseewald/vim-anyfold'                               " Fold code
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
Plug 'airblade/vim-gitgutter'             " Extension for git
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
if !g:isAndroid
    Plug 'w0rp/ale'                   " Syntax checking plugin
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
