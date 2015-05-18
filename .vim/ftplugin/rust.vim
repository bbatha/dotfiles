setlocal softtabstop=4
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab

let g:racer_cmd = "$HOME/.vim/plugged/racer/target/release/racer"
nnoremap gd :call racer#GoToDefinition()<cr>

set omnifunc=racer#Complete
