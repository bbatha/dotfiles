setlocal softtabstop=4
setlocal tabstop=4
setlocal shiftwidth=4
setlocal textwidth=120

setlocal omnifunc=tern#Complete
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1

nnoremap <silent> <buffer> gb :TernDef<CR>
