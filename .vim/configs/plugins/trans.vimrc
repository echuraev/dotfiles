if executable('trans')
    command! -range=% Trans execute "!trans :ru '".GetVisualSelection()."'"
    set keywordprg=trans\ -brief\ :ru
endif

