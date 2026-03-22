-- nvim-treesitter v1.0 rewrite: no more nvim-treesitter.configs
-- Highlighting is now via Neovim built-in vim.treesitter, auto-enabled for known filetypes.
-- This plugin is now just a parser manager + indent module.
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    config = function()
      -- setup() only accepts install_dir in the new API
      require('nvim-treesitter').setup()

      -- Install parsers if not already present
      local parsers = {
        'rust', 'go', 'gomod', 'gowork',
        'javascript', 'typescript', 'tsx',
        'python', 'lua', 'vim', 'vimdoc',
        'markdown', 'markdown_inline',
        'toml', 'json', 'yaml',
        'bash', 'html', 'css',
      }
      require('nvim-treesitter.install').install(parsers)

      -- Enable treesitter-based indent for all filetypes that have it
      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('TreesitterIndent', { clear = true }),
        callback = function()
          if pcall(vim.treesitter.start) then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },

  -- Textobjects: new standalone API (no longer uses nvim-treesitter.configs)
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    lazy = false,
    config = function()
      require('nvim-treesitter-textobjects').setup({
        select = { lookahead = true },
        move = { set_jumps = true },
      })

      local select = require('nvim-treesitter-textobjects.select')
      local move = require('nvim-treesitter-textobjects.move')

      -- Text object keymaps
      local textobjects = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
      }
      for key, query in pairs(textobjects) do
        vim.keymap.set({ 'x', 'o' }, key, function()
          select.select_textobject(query, 'textobjects')
        end, { desc = 'Select ' .. query })
      end

      -- Move keymaps
      vim.keymap.set('n', ']f', function() move.goto_next_start('@function.outer', 'textobjects') end, { desc = 'Next function start' })
      vim.keymap.set('n', '[f', function() move.goto_previous_start('@function.outer', 'textobjects') end, { desc = 'Prev function start' })
    end,
  },
}
