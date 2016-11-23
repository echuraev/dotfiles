call plug#begin('~/.vim/plugged')

" Code Complition
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }
Plug 'davidhalter/jedi-vim'           " Python autocomplition

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Common
Plug 'ervandew/supertab'              " Plugin for complition with <Tab>
Plug 'tpope/vim-fugitive'             " Git plugin
Plug 'airblade/vim-gitgutter'         " Extencion for git
Plug 'terryma/vim-multiple-cursors'   " Plugin for multiple cursors
Plug 'mhinz/vim-startify'             " Nice start screen
Plug 'vim-scripts/opencl.vim'         " OpenCL syntax highlight 
Plug 'scrooloose/syntastic'           " Syntax checking plugin
" Plug 'marcweber/vim-addon-mw-utils' | Plug 'tomtom/tlib_vim' | Plug 'garbas/vim-snipmate'            " Snippets
" Plug 'L9' | Plug 'FuzzyFinder'
Plug 'jiangmiao/auto-pairs'           " Add auto-pairs
" vimprj for project management, indexer for file indexing and vimprj and
" inexer depends from DfrankUtil
Plug 'vim-scripts/DfrankUtil' | Plug 'vim-scripts/vimprj' | Plug 'vim-scripts/indexer.tar.gz'
" Plugin 'wikitopian/hardmode'            " Vim hardcode mode
Plug 'majutsushi/tagbar'              " Tagbar
Plug 'vim-scripts/Conque-GDB'         " Conque GDB
Plug 'jceb/vim-orgmode'               " Org-Mode for vim
Plug 'tpope/vim-speeddating'          " Speeddating it is necassery for Org-Mode
" View
Plug 'yggdroot/indentline'            " Displaying thin vertical lines at each indentation level
Plug 'octol/vim-cpp-enhanced-highlight' " C++ highlighting
" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'powerline/fonts', { 'do': './install.sh' }

" Tree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

call plug#end()

let g:plug_threads = 8
