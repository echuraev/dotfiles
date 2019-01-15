set textwidth=80
" Markdown {{{ "
if exists('g:loaded_mkdp')
    nmap <silent> <F8> <Plug>MarkdownPreview        " for normal mode
    imap <silent> <F8> <Plug>MarkdownPreview        " for insert mode
    nmap <silent> <F9> <Plug>StopMarkdownPreview    " for normal mode
    imap <silent> <F9> <Plug>StopMarkdownPreview    " for insert mode
endif
" }}} Markdown "

