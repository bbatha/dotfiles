call plug#begin('~/.config/nvim/plugged')
" UI enhancements
Plug 'chriskempson/base16-vim' " better syntax colors
Plug 'bling/vim-airline' " pretty status bar
Plug 'takac/vim-hardtime' " training to stop using hjkl
Plug 'tpope/vim-unimpaired' " The missing shortcuts

" Languages
Plug 'tpope/vim-haml', { 'for': 'haml' } " haml syntax highlighting
" better js highlighting/indenting
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
" mustache/handlebars template support
Plug 'mustache/vim-mustache-handlebars', { 'for': ['handlebars', 'mustache'] }
Plug 'c9s/perlomni.vim', { 'for': 'perl' }  " better perl completion engine
Plug 'dag/vim2hs', { 'for': 'haskell' } " better haskell syntax highlighting
Plug 'wting/rust.vim', { 'for': 'rust' } " rust syntax
Plug 'cespare/vim-toml', { 'for': 'toml' } " toml syntax
Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown

" General autocomplete. Slows down first launch on host and requires
" a c++11 compatible libstdc++
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang' }

" GHCMOD integration for vim. improves syntastic and autocompletion. can infer types.
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
" rust autocompletion
Plug 'racer-rust/vim-racer', { 'for': 'rust' } " requires racer to be cargo installed
Plug 'marijnh/tern_for_vim', { 'for': 'javascript', 'do': 'nvm use stable; npm install' } " js autocomplete

" Motion
Plug 'bkad/camelcasemotion' " Motion for camelcase words
Plug 'tpope/vim-surround' " edit surronding tags of text object
Plug 'tpope/vim-repeat' " fix repeat for use with common plugins

" Time savers
Plug 'ctrlpvim/ctrlp.vim' " fuzzy filename matching.
Plug 'AndrewRadev/splitjoin.vim' " Split function lists

" Dev tools
Plug 'benekastah/neomake' " syntax checker
Plug 'rking/ag.vim' " ag support -- may switch to ack the plugin seems better
call plug#end()

syntax on
set hidden
set encoding=utf-8
set fileformat=unix
set history=100
set shortmess=filmnrxtTI
set nobackup

""""DISPLAY
set laststatus=2
set nu
set rnu
set ruler
set showcmd
set showmatch
set showmode
set title
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set matchtime=2
set matchpairs+=<:>

" backspace behaves 'normally'
set esckeys
set ignorecase
set smartcase
set magic

set whichwrap+=<,>,h,l " cursor keys also wrap

" spaces instead of tabs
" prefer 2 spaces
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

" Always leave x lines between the cursor and the bottom of the screen
set scrolloff=6

" wrap settings
set nowrap " wrap lines rather than use horiz. scrolling
set linebreak " try not to wrap in the middle of a word
set textwidth=99 " 99-character lines maximum

" Seed normal omnicomplete dbs
set omnifunc=syntaxcomplete#Complete

"" Matchit
"""""""""""""""
runtime macros/matchit.vim

" Automatically restore cursor position when possible
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \ exe "normal! g`\"" |
      \ endif

" joining
" delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

" only 1 space after "." when joining
set nojoinspaces

" joining with indents is useless. clean them up automatically
nnoremap gJ Jdiw

"Command line

" display incomplete commands below the status line
set showcmd

" Default shell and shell syntex
set shell=bash
let g:is_bash=1

" performance

" time out on key codes but not mappings
set notimeout
set ttimeout
set ttimeoutlen=100

" update syntax highlighting for more lines helps scrolling permformance
syntax sync minlines=256

" don't syntax highlight long lines
set synmaxcol=256

""""""""""""""""""""""""""""""""""""""""
"" settings controlling temporary/backup files
""""""""""""""""""""""""""""""""""""""""

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Configure undo files (if we're in vim 7.3 and +persistent_undo has been
" compiled)
if has("persistent_undo")
  set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
  set undofile
endif

""
" Stop annoying me every time I have a file open in two different vim
" sessions.
" 'e' is "Edit Anyway" in this circumstance. Other options you could use
" here:
" 'q' - quit.
" 'o' - open the file in read-only mode.
" 'r' - recover the changes.
augroup SimultaneousEdits
  autocmd!
  autocmd SwapExists * :let v:swapchoice = 'e'
augroup END

" Highlight EOL whitespace, http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" The above flashes annoyingly while typing, be calmer in insert mode
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

function! s:FixWhitespace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction

" Run :FixWhitespace to remove end of line white space
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)

let g:airline_theme = 'powerlineish'

if has("gui_running")
  set guioptions=ac
  set columns=120
  set lines=60
  set base16colorspace=256
else
  let g:airline_powerline_fonts = 1
endif

let base16colorspace=256
set background=dark
colorscheme base16-solarized

" \ is leader
let mapleader = ' '
let maplocalleader = '\\'

""FACTSET SKELETONS
""source /home/fonix/prd_progs/tools/conf/vim/fds.vimrc

""Enable repeat.vim
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"" Ag - the_silver_searcher
let g:agprg='ag --column'

"" Neomake
autocmd! BufEnter * Neomake
autocmd! BufWritePost * Neomake
let g:neomake_javascript_enabled_markers = ['jshint', 'jscs']

" Fix quickfix list to wrap
autocmd FileType qf setlocal wrap linebreak
nnoremap <leader>e :Errors<CR>
nnoremap <leader>n :lnext<CR>
nnoremap <leader>N :lprev<CR>

"" vim2hs
let g:haskell_conceal = 0
let g:haskell_conceal_enumerations = 0
let g:haskell_tabular = 0

"" CtrlP
let g:ctrlp_custom_ignore = {
  \   'dir':  '\.git$\|\.hg$\|\.svn$',
  \   'file': '\.exe$\|\.so$\|\.dll$|\.a$'
  \ }

"" Use source control to search for increased speed and so that
"" ignore files are respected
let g:ctrlp_user_command = {
  \ 'types': {
  \   1: ['.git', 'cd %s && git ls-files'],
  \   2: ['.hg', 'hg --cwd %s locate -I .'],
  \   3: ['.p4rc', "cd %s && p4 have | awk '{ print $3 }'"],
  \ },
  \   'fallback': 'find %s -type f'
  \ }

let g:ctrlp_root_markers = ['.p4rc']

let g:ctrlp_use_caching = 0

"" Hardtime
let g:hardtime_default_on = 1
" Don't stop directional motion in quickfix buffer
let g:hardtime_ignore_quickfix = 1
" Different keys are ok
let g:hardtime_allow_different_key = 1
" 2 key presses is reasonable 2j is the same number of keypresses as jj
let g:hardtime_maxcount = 2

"" Racer
let g:racer_cmd = "$HOME/.vim/bundle/racer/target/release/racer"

"" YouCompleteMe
" Load .ycm_extra_conf without prompting
let g:ycm_confirm_extra_conf = 0
" Add rust
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
  \   'ruby' : ['.', '::'],
  \   'rust' : ['.', '::', '::{'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
" Seed the identifiers db with language keywords
let g:ycm_seed_identifiers_with_syntax = 1
" close the preview window after completing
let g:ycm_autoclose_preview_window_after_completion = 1
" close the preview window when leaving insert mode
let g:ycm_autoclose_preview_window_after_insertion = 1

"" Clang-format
let g:clang_format#detect_style_file = 1
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

"" markdown
" vim thinks md files are modula2 by default
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'javascript', 'bash=sh']
