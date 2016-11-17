" path to .vimprj folder
let s:sVimprjPath = expand('<sfile>:p:h')
let s:sProjectPath = simplify(s:sVimprjPath.'/..')

" point Indexer to our local .indexer_files
let g:indexer_indexerListFilename = s:sVimprjPath.'/.indexer_files'

let g:indexer_dontUpdateTagsIfFileExists = 1
let g:indexer_ctagsDontSpecifyFilesIfPossible = 1
let g:indexer_ctagsCommandLineOptions = '--c++-kinds=+p+l --c-kinds=+l --fields=+iaS --extra=+q' " /usr/include /usr/include/c++/4.2.1 /usr/local/include/'

let &makeprg  = 'rm -fR '.s:sProjectPath.'/build '.s:sProjectPath.'/bin && mkdir '.s:sProjectPath.'/../build && cd '.s:sProjectPath.'/build && cmake '.s:sProjectPath.' && cd '.s:sProjectPath.' && make -C '.s:sProjectPath.'/build'
