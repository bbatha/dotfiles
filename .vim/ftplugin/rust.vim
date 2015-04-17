setlocal softtabstop=4
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab

nnoremap gd :call racer#GoToDefinition()<cr>
"if !exists('g:neocomplete#sources#omni#functions')
"  let g:neocomplete#sources#omni#functions = {}
"endif
"
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
"
"let g:neocomplete#sources#omni#functions.rust = 'racer#Complete'
"let g:neocomplete#sources#omni#input_patterns.rust = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
set omnifunc=racer#Complete
