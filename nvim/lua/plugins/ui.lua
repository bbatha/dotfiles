return {
  -- Solarized dark colorscheme with treesitter/LSP token support
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('solarized').setup({
        variant = 'autumn', -- dark solarized variant
        styles = {
          comments = { italic = true },
          keywords = {},
          functions = {},
        },
      })
      vim.cmd.colorscheme('solarized')
    end,
  },

  -- Statusline (replaces vim-airline)
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = 'solarized_dark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  -- Hardtime: break bad movement habits (replaces takac/vim-hardtime)
  {
    'm4xshen/hardtime.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {
      enabled = true,
      disable_filetypes = { 'qf', 'netrw', 'NvimTree', 'lazy', 'mason', 'oil' },
      max_count = 2,
      allow_different_key = true,
    },
  },
}
