setlocal softtabstop=4
setlocal tabstop=4
setlocal shiftwidth=4
setlocal textwidth=120

let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

nnoremap <silent> <buffer> gd :TernDef<CR>
let g:neomake_javascript_enabled_markers = ['jshint', 'jscs']
