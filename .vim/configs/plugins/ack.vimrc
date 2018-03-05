if executable('rg')
    let g:ackprg = 'rg --vimgrep --smart-case --no-heading'
endif
