return {
  -- Mason: installs LSP servers, formatters, linters
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },

  -- Bridge between mason and nvim-lspconfig (ensures servers are installed)
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      ensure_installed = {
        'lua_ls',   -- for editing this config
        'gopls',    -- Go
        'ts_ls',    -- TypeScript/JavaScript
        'pyright',  -- Python
        -- rust_analyzer is handled by rustaceanvim, not here
      },
    },
  },

  -- nvim-lspconfig: provides server default configs (cmd, filetypes, root_dir)
  -- Using the new vim.lsp.config / vim.lsp.enable API (Neovim 0.11+)
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'saghen/blink.cmp',
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Buffer-local LSP keymaps via LspAttach autocmd
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('LspKeymaps', { clear = true }),
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }
          local map = function(keys, fn, desc)
            vim.keymap.set('n', keys, fn, vim.tbl_extend('force', opts, { desc = desc }))
          end

          map('gd', vim.lsp.buf.definition, 'Go to definition')
          map('gD', vim.lsp.buf.declaration, 'Go to declaration')
          map('gr', vim.lsp.buf.references, 'Go to references')
          map('gi', vim.lsp.buf.implementation, 'Go to implementation')
          map('K', vim.lsp.buf.hover, 'Hover documentation')
          map('<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
          map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
          vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help,
            vim.tbl_extend('force', opts, { desc = 'Signature help' }))
        end,
      })

      -- Disable ts_ls formatting (prettier handles it via conform.nvim)
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('TsLsNoFormat', { clear = true }),
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client and client.name == 'ts_ls' then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end
        end,
      })

      -- Configure servers using the new vim.lsp.config API
      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.config('gopls', {
        capabilities = capabilities,
        settings = {
          gopls = {
            gofumpt = true,
            analyses = { unusedparams = true },
            staticcheck = true,
          },
        },
      })

      vim.lsp.config('ts_ls', { capabilities = capabilities })
      vim.lsp.config('pyright', { capabilities = capabilities })

      vim.lsp.enable({ 'lua_ls', 'gopls', 'ts_ls', 'pyright' })
    end,
  },

  -- lazydev: Neovim Lua API type annotations for lua_ls
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
}
