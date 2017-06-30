setlocal noexpandtab
setlocal softtabstop=4
setlocal tabstop=4
setlocal shiftwidth=4
setlocal textwidth=100

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
" Beautiful but sluggish
"let g:go_highlight_fields = 1
"let g:go_highlight_types = 1
"let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

let g:go_play_open_browser = 0

"let g:neomake_go_gometalinter_maker = {
"      \ 'args': ['-t', '%:p:h'],
"      \ 'append_file': 0,
"      \ 'errorformat':
"        \ '%E%f:%l:%c:error: %m,' .
"        \ '%E%f:%l::error: %m,' .
"        \ '%W%f:%l:%c:warning: %m,' .
"        \ '%W%f:%l::warning: %m'
"      \ }
let g:go_metalinter_autosave = 0

" let g:neomake_go_enabled_makers = [ 'gometalinter' ]

nmap <leader>b <Plug>(go-build)
nmap <leader>t <Plug>(go-test)
nmap <leader>c <Plug>(go-coverage)

nmap <Leader>gd <Plug>(go-def-split)
"nmap <Leader>gdv <Plug>(go-def-vertical)
"nmap <Leader>gdt <Plug>(go-def-tab)

nmap <Leader>d <Plug>(go-doc)
"nmap <Leader>dv <Plug>(go-doc-vertical)

nmap <Leader>s <Plug>(go-implements)

nmap <Leader>i <Plug>(go-info)
nmap <Leader>e <Plug>(go-rename)

"nmap <leader>r <Plug>(go-run)
"" Neovim only
nmap <Leader>r <Plug>(go-run-split)
"nmap <leader>rt <Plug>(go-run-tab)
"nmap <Leader>rv <Plug>(go-run-vertical)
