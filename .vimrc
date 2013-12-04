set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'camelcasemotion'
Bundle 'tpope/vim-surround'
Bundle 'altercation/vim-colors-solarized'
Bundle 'taglist.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'matchit.zip'
Bundle 'ruby-matchit'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-haml'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'SirVer/ultisnips'
Bundle 'pangloss/vim-javascript'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-unimpaired'

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

" Highlight trailing whitespace in vim on non empty lines, but not while
" typing in insert mode!
highlight ExtraWhitespace ctermbg=red guibg=Brown
match ExtraWhitespace /\s\+$/
"au ColorScheme * highlight ExtraWhitespace guibg=red
"au BufEnter * match ExtraWhitespace /\S\zs\s\+$/
"au InsertEnter * match ExtraWhitespace /\S\zs\s\+\%#\@<!$/
"au InsertLeave * match ExtraWhiteSpace /\S\zs\s\+$/
"set fillchars+=stl:\ ,stlnc:\
""let g:Powerline_symbols = 'fancy'

"set guifont=inconsolata-dz\ for\ Powerline\ 10

"let g:solarized_termcolors=256
set background=dark
colorscheme solarized
if has("gui_running")
  set guioptions=ac
  set lines=60
endif

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
""TAGLIST
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_Process_File_Always = 1
let Tlist_Use_Right_Window = 1
let Tlist_Ctags_Cmd = '/usr/bin/ctags'


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

""Matchit
"""""""""""""""
runtime macros/matchit.vim

""YCM
let g:ycm_key_invoke_completion = '<C-Space>'

""Syntastic
nnoremap <leader>e :Errors<CR>
nnoremap <leader>n :lnext<CR>
nnoremap <leader>N :lprev<CR>

""Ultisnips conflicts with YCM -- fix that
function! g:UltiSnips_Complete()
  call UltiSnips_ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips_JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"


""SQL default to postgresql
""let g:sql_type_default='postgresql'
