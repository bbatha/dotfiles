set nocompatible               " be iMproved
filetype off                   " required!

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" let NeoBundle manage NeoBundle
" required!
NeoBundleFetch 'Shougo/neobundle.vim'

" UI enhancements
NeoBundle 'altercation/vim-colors-solarized' " pretty colors
NeoBundle 'bling/vim-airline' " pretty status bar
NeoBundle 'takac/vim-hardtime' " training to stop using hjkl

" Languages
NeoBundle 'tpope/vim-haml' " haml syntax highlighting
NeoBundle 'pangloss/vim-javascript' " better js highlighting/indenting
NeoBundle 'mustache/vim-mustache-handlebars' " mustache/handlebars template support
NeoBundle 'c9s/perlomni.vim' " better perl completion engine
NeoBundle 'sql.vim' " better sql support
NeoBundle 'dag/vim2hs' " better haskell syntax highlighting
NeoBundle 'wting/rust.vim' " rust syntax
NeoBundle 'cespare/vim-toml' " toml syntax
" GHCMOD integration for vim. improves syntastic and autocompletion. can infer types.
NeoBundle 'eagletmt/ghcmod-vim'
" rust autocompletion
"NeoBundle 'bbatha/racer', {
"  \   'build' : {
"  \     'unix' : 'make'
"  \   }
"  \ }

" Motion
NeoBundle 'camelcasemotion' " Motion for camelcase words
NeoBundle 'tpope/vim-surround' " edit surronding tags of text object
NeoBundle 'matchit.zip' " better % matching
NeoBundle 'ruby-matchit' " match 'end'
NeoBundle 'tpope/vim-repeat' " fix repeat for use with common plugins
NeoBundle 'mattn/emmet-vim' " expand css style tags to html

" Time savers
NeoBundle 'kien/ctrlp.vim' " fuzzy filename matching.
NeoBundle 'Shougo/neocomplete' " autocomplete

" Dev tools
NeoBundle 'scrooloose/syntastic' " syntax checker
NeoBundle 'rking/ag.vim' " ag support -- may switch to ack the plugin seems better

" Utilities
" VIMPROC Execute things remotely -- speeds up a lot of plugins
NeoBundle 'Shougo/vimproc.vim', { 'build' : { 'unix': 'make -f make_unix.mak' } }

call neobundle#end()

NeoBundleCheck

syntax on
filetype plugin indent on
set hidden
set encoding=utf-8
set fileformat=unix
set history=100
set shortmess=filmnrxtTI
set nobackup

""""DISPLAY
set laststatus=2
set nu
set ruler
set showcmd
set showmatch
set showmode
set title
set wildmenu
set wildignore=*.o,*.obj,*.bak,*.exe,*.py[co],*.swp,*~,*.pyc,.svn
set matchtime=2
set matchpairs+=<:>
set hlsearch
set incsearch

""PasteMode
set pastetoggle=<F2>

""FACTSET SKELETONS
""source /home/fonix/prd_progs/tools/conf/vim/fds.vimrc

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
  set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline\ Medium\ 10
  set guioptions=ac
  set columns=120
  set lines=60
  let g:solarized_termcolors=256
else
  let g:solarized_termcolors=16

  " Airline
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  let g:airline_left_sep = '⮀'
  let g:airline_left_alt_sep = '⮁'
  let g:airline_right_sep = '⮂'
  let g:airline_right_alt_sep = '⮃'
  let g:airline_symbols.branch = '⭠'
  let g:airline_symbols.readonly = '⭤'
  let g:airline_symbols.linenr = '⭡'

  "For more intricate customizations, you can replace the predefined sections
endif

set background=dark
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""
"" This file manages all global editing
"" settings, such as indent size, etc.
""""""""""""""""""""""""""""""""""""""""

" automatically indent lines and try to do it intelligently
set autoindent
set smarttab
set smartindent

" backspace behaves 'normally'
set esckeys
set ignorecase
set smartcase
set magic
set backspace=indent,eol,start

set whichwrap+=<,>,h,l " cursor keys also wrap

" spaces instead of tabs
" prefer 2 spaces
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

set autoread " automatically reload a file if it's changed outside vim

" wrap settings
set nowrap " wrap lines rather than use horiz. scrolling
set linebreak " try not to wrap in the middle of a word
set textwidth=80 " 80-character lines maximum

if &term =~? "^xterm.*"
  set ttyfast
  set ttyscroll=3
endif

"line numbers
"Makes VIM slow don't enable :(
"set relativenumber
"set number

" format settings
" t - Auto-wrap text using textwidth
" c - Auto-wrap comments using textwidth, inserting the current comment
" leader automatically.
" r - Automatically insert the current comment leader after hitting <Enter>
" in Insert mode.
" q - Allow formatting of comments with "gq".
" Note that formatting will not change blank lines or lines containing
" only the comment leader. A new paragraph starts after such a line,
" or when the comment leader changes.
" n - When formatting text, recognize numbered lists.
" 2 - When formatting text, use the indent of the second line of a paragraph
" for the rest of the paragraph, instead of the indent of the first line.
" 1 - Don't break a line after a one-letter word. It's broken before it
" instead (if possible).
set formatoptions=tcrqn21

" Automatically restore cursor position when possible
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \ exe "normal! g`\"" |
      \ endif

""Enable repeat.vim
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

let g:agprg='ag --column'


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

" \ is leader
let mapleader = ' '
let maplocalleader = '\\'

"""""""""""""""
runtime macros/matchit.vim

""Syntastic

" Fix quickfix list to wrap
autocmd FileType qf setlocal wrap linebreak
nnoremap <leader>e :Errors<CR>
nnoremap <leader>n :lnext<CR>
nnoremap <leader>N :lprev<CR>
let g:syntastic_enable_balloons = 0
" potentially risky. it will run BEGIN, UNITCHECK, CHECK blocks and use
" statements
let g:syntastic_enable_perl_checker = 1

" Autocomplete

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" vim2hs
let g:haskell_conceal = 0
let g:haskell_conceal_enumerations = 0
let g:haskell_tabular = 0

" ctrlp
let g:ctrlp_custom_ignore= {
  \ 'dir': '\v[\/](\.(git|hg|svn))|(node_modules|vendor|bin|rint)$',
  \ 'file': '\v\.(exe|so|dll|.a)$'
  \ }

let g:ctrlp_root_markers = ['.p4rc']
