-- Leader keys must be set before plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Shell
vim.opt.shell = 'bash'
vim.g.is_bash = 1

-- Built-in editorconfig support (replaces editorconfig-vim plugin)
vim.g.editorconfig = true

-- Display
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.showmode = true
vim.opt.title = true
vim.opt.matchtime = 2
vim.opt.matchpairs:append('<:>')
vim.opt.laststatus = 2
vim.opt.wildignore = { '*.o', '*.obj', '*.bak', '*.exe', '*.py[co]', '*.swp', '*~', '*.pyc', '.svn' }

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.magic = true
vim.opt.inccommand = 'split'

-- Cursor wrapping
vim.opt.whichwrap:append('<,>,h,l')

-- Indentation (2 spaces by default; overridden per-filetype in ftplugin/)
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Scrolling
vim.opt.scrolloff = 6

-- Line wrapping
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.textwidth = 99

-- Joining
vim.opt.formatoptions:append('j')
vim.opt.joinspaces = false

-- General
vim.opt.hidden = true
vim.opt.fileformat = 'unix'
vim.opt.history = 100
vim.opt.shortmess = 'filmnrxtTI'
vim.opt.backup = false

-- Performance
vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 100
vim.opt.synmaxcol = 256

-- Persistent undo (Neovim stores in ~/.local/state/nvim/undo by default)
vim.opt.undofile = true

-- matchit is bundled with Neovim; treesitter handles syntax highlighting
vim.cmd('runtime macros/matchit.vim')
