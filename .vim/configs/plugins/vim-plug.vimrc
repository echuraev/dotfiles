call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Add plugins to &runtimepath




" Common
Plug 'tpope/vim-fugitive'             " Git plugin
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh --clang-completer' }         " Code complition
Plug 'mhinz/vim-startify'             " Nice start screen
Plug 'vim-scripts/opencl.vim'         " OpenCL syntax highlight 
Plug 'scrooloose/syntastic'           " Syntax checking plugin
" vimprj and indexer depends from it
Plug 'vim-scripts/DfrankUtil'
" Plugin 'wikitopian/hardmode'            " Vim hardcode mode
Plug 'vim-scripts/Conque-GDB'         " Conque GDB
Plug 'jceb/vim-orgmode'               " Org-Mode for vim
Plug 'tpope/vim-speeddating'          " Speeddating it is necassery for Org-Mode

" Project
Plug 'vim-scripts/vimprj'

" Debug
"Plugin 'https://github.com/joonty/vdebug.git'

" Indexer
Plug 'vim-scripts/indexer.tar.gz'

" Tree
"Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

call plug#end()

let g:plug_threads = 8
