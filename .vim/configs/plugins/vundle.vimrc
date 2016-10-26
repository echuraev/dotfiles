set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Common
Plugin 'VundleVim/Vundle.vim'           " Plugin manager
Plugin 'tpope/vim-fugitive'             " Git plugin
Plugin 'Valloric/YouCompleteMe'         " Code complition
Plugin 'mhinz/vim-startify'             " Nice start screen
Plugin 'vim-scripts/opencl.vim'         " OpenCL syntax highlight 
Plugin 'scrooloose/syntastic'           " Syntax checking plugin
" vimprj and indexer depends from it
Plugin 'vim-scripts/DfrankUtil'
" Plugin 'wikitopian/hardmode'            " Vim hardcode mode
Plugin 'vim-scripts/Conque-GDB'         " Conque GDB

" Project
Plugin 'vim-scripts/vimprj'

" Debug
"Plugin 'https://github.com/joonty/vdebug.git'

" Indexer
Plugin 'vim-scripts/indexer.tar.gz'

" Tree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'


call vundle#end()            " required
filetype plugin indent on    " required
