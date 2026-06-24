" Neovim uses Treesitter folding (see nvim-native.vimrc).
if has('nvim')
    finish
endif

autocmd Filetype cpp AnyFoldActivate
autocmd Filetype lua AnyFoldActivate
autocmd Filetype java AnyFoldActivate
autocmd Filetype py AnyFoldActivate
autocmd Filetype cmake AnyFoldActivate

let anyfold_fold_comments=1
set foldlevel=0
