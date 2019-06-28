setlocal textwidth=80
" Markdown {{{ "
if exists('g:loaded_mkdp')
    nmap <silent> <buffer> <F8> <Plug>MarkdownPreview        " for normal mode
    imap <silent> <buffer> <F8> <Plug>MarkdownPreview        " for insert mode
    nmap <silent> <buffer> <F9> <Plug>StopMarkdownPreview    " for normal mode
    imap <silent> <buffer> <F9> <Plug>StopMarkdownPreview    " for insert mode
endif
" }}} Markdown "

