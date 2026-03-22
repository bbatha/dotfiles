return {
  -- nvim-surround: Lua rewrite of vim-surround (same ys/cs/ds keymaps)
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup()
    end,
  },

  -- vim-unimpaired: [b/]b buffer nav, [q/]q quickfix, etc.
  { 'tpope/vim-unimpaired', event = 'VeryLazy' },

  -- vim-repeat: make . work with plugin mappings
  { 'tpope/vim-repeat', event = 'VeryLazy' },

  -- camelCaseMotion: \w \b \e for camelCase/snake_case word motion
  {
    'bkad/camelcasemotion',
    event = 'VeryLazy',
    config = function()
      vim.g.camelcasemotion_key = '\\'
    end,
  },

  -- splitjoin: gS to split, gJ to join (note: gJ is overridden in keymaps.lua)
  { 'AndrewRadev/splitjoin.vim', event = 'VeryLazy' },
}
