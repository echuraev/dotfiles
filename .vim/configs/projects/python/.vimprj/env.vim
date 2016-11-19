" path to .vimprj folder
let s:sVimprjPath = expand('<sfile>:p:h')
let s:sProjectPath = simplify(s:sVimprjPath.'/..')

" point Indexer to our local .indexer_files
let g:indexer_indexerListFilename = s:sVimprjPath.'/.indexer_files'

let g:indexer_dontUpdateTagsIfFileExists = 1
let g:indexer_ctagsDontSpecifyFilesIfPossible = 1

