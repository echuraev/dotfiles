" C-Tab key doesn't work in terminal. So I remapped these function to <C-Space>
if g:vimwiki_table_mappings
    iunmap <buffer> <Tab>
    inoremap <expr> <buffer> <C-Space> vimwiki#tbl#kbd_tab()
    inoremap <expr> <buffer> <C-S-Space> vimwiki#tbl#kbd_shift_tab()
endif
