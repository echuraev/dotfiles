augroup GTest
    autocmd FileType cpp nnoremap <silent> <leader>tt :GTestRun<CR>
    autocmd FileType cpp nnoremap <silent> <leader>tu :GTestRunUnderCursor<CR>
    autocmd FileType cpp nnoremap          <leader>tc :GTestCase<space>
    autocmd FileType cpp nnoremap          <leader>tn :GTestName<space>
    autocmd FileType cpp nnoremap <silent> <leader>te :GTestToggleEnabled<CR>
    autocmd FileType cpp nnoremap <silent> ]T         :GTestNext<CR>
    autocmd FileType cpp nnoremap <silent> [T         :GTestPrev<CR>
    autocmd FileType cpp nnoremap <silent> <leader>tf :CtrlPGTest<CR>
    autocmd FileType cpp nnoremap <silent> <leader>tj :GTestJump<CR>
    autocmd FileType cpp nnoremap          <leader>ti :GTestNewTest<CR>i
augroup END
let g:gtest#highlight_failing_tests = 1
