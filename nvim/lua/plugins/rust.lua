return {
  -- rustaceanvim: rich rust-analyzer integration
  -- Handles rust-analyzer directly (do NOT also configure it in lsp.lua)
  -- vim.g.rustaceanvim must be set before the plugin loads; use init for that.
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    ft = 'rust',
    dependencies = { 'saghen/blink.cmp' },
    config = function()
      vim.g.rustaceanvim = {
        tools = {
          hover_actions = { auto_focus = true },
        },
        server = {
          capabilities = require('blink.cmp').get_lsp_capabilities(),
          settings = {
            ['rust-analyzer'] = {
              checkOnSave = { command = 'clippy' },
              cargo = { allFeatures = true },
              procMacro = { enable = true },
            },
          },
        },
      }
    end,
  },
}
