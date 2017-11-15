let g:vimwiki_list = [{'path': '~/Dropbox/wiki', 'css_file': '~/.vim/configs/plugins/vimwiki/style.css'}, {'path': '~/Workspace/wiki', 'css_file': '~/.vim/configs/plugins/vimwiki/style.css'}]         " Default paths of wiki's
let g:vimwiki_menu = ''                                                                 " No menu in gVim
let g:vimwiki_hl_headers = 1                                                            " Highlight headers in different colors
let g:vimwiki_hl_cb_checked = 2                                                         " Highlight completed tasks
au BufEnter *.wiki :syntax sync fromstart                                               " Work around from help for highlight tasks
let g:vimwiki_list_ignore_newline = 0                                                   " Conversion to HTML: Newlines in a list item are converted to <br />s.
let g:vimwiki_text_ignore_newline = 0                                                   " Conversion to HTML: Newlines in a list item are converted to <br />s.
let g:vimwiki_folding = 'syntax'
autocmd FileType vimwiki set foldmethod=syntax foldenable foldlevel=1
