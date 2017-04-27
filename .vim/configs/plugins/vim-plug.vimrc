call plug#begin('~/.vim/plugged')

" Code Complition
if !has('win32')
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
endif
" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'             " Git plugin
Plug 'tpope/vim-unimpaired'           " Fast navigation by commits for fugitive
Plug 'airblade/vim-gitgutter'         " Extencion for git
Plug 'gregsexton/gitv'                " Gitk for vim

" Project
" vimprj for project management, indexer for file indexing and vimprj and
" inexer depends from DfrankUtil
"Plug 'vim-scripts/DfrankUtil' | Plug 'vim-scripts/vimprj'
Plug 'tpope/vim-dispatch'             " Project compiling

" Common
Plug 'terryma/vim-multiple-cursors'   " Plugin for multiple cursors
Plug 'mhinz/vim-startify'             " Nice start screen
Plug 'vim-syntastic/syntastic'           " Syntax checking plugin
Plug 'chrisbra/vim-diff-enhanced'     " Diff viewer
Plug 'jiangmiao/auto-pairs'           " Add auto-pairs
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'              " Tagbar
" Plug 'tpope/vim-speeddating' | Plug 'jceb/vim-orgmode'       " Org-Mode for vim
Plug 'zefei/vim-wintabs'              " Separate tabs for windows
if !has('win32')
    Plug 'vim-scripts/Conque-GDB', { 'on': 'ConqueGdb' }         " Conque GDB
endif

" Shell
Plug 'Shougo/vimproc.vim', {'do' : 'make'} | Plug 'shougo/vimshell.vim'       " Vim shell

" View
Plug 'yggdroot/indentline'            " Displaying thin vertical lines at each indentation level
Plug 'sjl/gundo.vim'                  " Visualize vim undo tree

" Syntax highlight
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['cpp'] } " C++ highlighting
Plug 'petRUShka/vim-opencl', { 'for': 'opencl' }         " OpenCL syntax highlight
Plug 'tpope/vim-git'                  " git syntax highlight
if !has('win32')
    Plug 'pearance/vim-tmux'              " Tmux configuration highlight
endif

" Tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeTabsToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'jistr/vim-nerdtree-tabs', { 'on': 'NERDTreeTabsToggle' }

" LaTeX
if !has('win32')
    Plug 'vim-latex/vim-latex'            " Plugin for editing LaTeX files
    Plug 'xuhdev/vim-latex-live-preview'  " Plugin preview for LaTeX
endif

" Other
Plug 'wakatime/vim-wakatime'          " Time tracking
Plug 'itchyny/calendar.vim'           " Calendar in VIM
Plug 'osyo-manga/vim-over'            " Replace highlighter
Plug 'echuraev/ReplaceHighlighter'

call plug#end()

let g:plug_threads = 8
