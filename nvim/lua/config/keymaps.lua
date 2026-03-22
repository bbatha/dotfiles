-- Join without extra space (replaces old nnoremap gJ Jdiw)
vim.keymap.set('n', 'gJ', 'Jdiw', { desc = 'Join lines and remove extra space' })

-- Quickfix / location list navigation (was bound to neomake errors)
vim.keymap.set('n', '<leader>n', ':lnext<CR>', { silent = true, desc = 'Next location list item' })
vim.keymap.set('n', '<leader>N', ':lprev<CR>', { silent = true, desc = 'Previous location list item' })

-- Diagnostics (replaces :Errors from neomake)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic float' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
