let g:startify_change_to_dir = 0
let g:startify_files_number = 8
let g:startify_session_persistence = 1
let g:startify_bookmarks = ['~/.vimrc',]
let g:startify_skiplist = ['vimrc',]
let g:startify_custom_header = map(split(system('fortune ~/.vim/fortunes | cowsay -W 60'), '\n'), '"   ". v:val') + ['','']
