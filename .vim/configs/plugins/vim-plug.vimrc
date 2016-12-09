call plug#begin('~/.vim/plugged')

" Code Complition
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
" Plug 'davidhalter/jedi-vim', {'for': 'python'}           " Python autocomplition

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Git
Plug 'tpope/vim-fugitive'             " Git plugin
Plug 'airblade/vim-gitgutter'         " Extencion for git
Plug 'gregsexton/gitv'                " Gitk for vim

" Project
" vimprj for project management, indexer for file indexing and vimprj and
" inexer depends from DfrankUtil
Plug 'vim-scripts/DfrankUtil' | Plug 'vim-scripts/vimprj' | Plug 'vim-scripts/indexer.tar.gz'

" Common
Plug 'ervandew/supertab'              " Plugin for complition with <Tab>
Plug 'terryma/vim-multiple-cursors'   " Plugin for multiple cursors
Plug 'mhinz/vim-startify'             " Nice start screen
" Plug 'scrooloose/syntastic'           " Syntax checking plugin
Plug 'chrisbra/vim-diff-enhanced'     " Diff viewer
" Plug 'marcweber/vim-addon-mw-utils' | Plug 'tomtom/tlib_vim' | Plug 'garbas/vim-snipmate'            " Snippets
" Plug 'L9' | Plug 'FuzzyFinder'
Plug 'jiangmiao/auto-pairs'           " Add auto-pairs
Plug 'majutsushi/tagbar'              " Tagbar
Plug 'vim-scripts/Conque-GDB', { 'on': 'ConqueGdb' }         " Conque GDB
Plug 'tpope/vim-speeddating' | Plug 'jceb/vim-orgmode'       " Org-Mode for vim

" Shell
Plug 'Shougo/vimproc.vim', {'do' : 'make'} | Plug 'shougo/vimshell.vim'       " Vim shell

" View
Plug 'yggdroot/indentline'            " Displaying thin vertical lines at each indentation level
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['cpp'] } " C++ highlighting
Plug 'petRUShka/vim-opencl', { 'for': 'opencl' }         " OpenCL syntax highlight

" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/fonts', { 'do': './install.sh' }

" Tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

" LaTeX
Plug 'vim-latex/vim-latex'            " Plugin for editing LaTeX files

call plug#end()

let g:plug_threads = 8
