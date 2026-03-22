local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Restore cursor position when reopening a file
autocmd('BufReadPost', {
  group = augroup('RestoreCursor', { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Highlight trailing whitespace in red; suppress in insert mode
vim.api.nvim_set_hl(0, 'ExtraWhitespace', { ctermbg = 'darkred', bg = '#382424' })
autocmd('ColorScheme', {
  group = augroup('TrailingWhitespaceHL', { clear = true }),
  callback = function()
    vim.api.nvim_set_hl(0, 'ExtraWhitespace', { ctermbg = 'red', bg = 'red' })
  end,
})
autocmd('BufWinEnter', {
  group = augroup('TrailingWhitespace', { clear = true }),
  callback = function() vim.fn.matchadd('ExtraWhitespace', [[\s\+$]]) end,
})
autocmd('InsertLeave', {
  group = augroup('TrailingWhitespaceInsert', { clear = true }),
  callback = function() vim.fn.matchadd('ExtraWhitespace', [[\s\+$]]) end,
})
autocmd('InsertEnter', {
  group = augroup('TrailingWhitespaceInsertEnter', { clear = true }),
  callback = function() vim.fn.matchadd('ExtraWhitespace', [[\s\+\%#\@<!$]]) end,
})

-- FixWhitespace command: remove trailing whitespace from a range
vim.api.nvim_create_user_command('FixWhitespace', function(opts)
  local save = vim.fn.getpos('.')
  vim.cmd(string.format('silent! %d,%ds/\\s\\+$//', opts.line1, opts.line2))
  vim.fn.setpos('.', save)
end, { range = '%', desc = 'Remove trailing whitespace' })

-- Silently edit when a swap file already exists
autocmd('SwapExists', {
  group = augroup('SimultaneousEdits', { clear = true }),
  callback = function() vim.v.swapchoice = 'e' end,
})

-- Markdown filetype for .md files
autocmd({ 'BufNewFile', 'BufReadPost' }, {
  group = augroup('MarkdownFT', { clear = true }),
  pattern = '*.md',
  callback = function() vim.bo.filetype = 'markdown' end,
})

-- Groovy filetype for Jenkinsfiles
autocmd({ 'BufRead', 'BufNewFile' }, {
  group = augroup('JenkinsfileFT', { clear = true }),
  pattern = 'Jenkinsfile',
  callback = function() vim.bo.filetype = 'groovy' end,
})

-- Fix quickfix list to wrap text
autocmd('FileType', {
  group = augroup('QuickfixWrap', { clear = true }),
  pattern = 'qf',
  callback = function()
    vim.wo.wrap = true
    vim.wo.linebreak = true
  end,
})
