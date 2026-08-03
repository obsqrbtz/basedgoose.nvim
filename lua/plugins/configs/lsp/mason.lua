local utils = require 'utils'

local enabled = not utils.is_nixos()

return {
  { 'mason-org/mason.nvim', enabled = enabled, opts = {} },
  {
    'mason-org/mason-lspconfig.nvim',
    enabled = enabled,
    -- nvim-lspconfig must be configured first: it registers our per-server
    -- `vim.lsp.config()` entries, which `automatic_enable` then picks up.
    dependencies = { 'mason-org/mason.nvim', 'neovim/nvim-lspconfig' },
    opts = function()
      local servers = vim.tbl_keys(require 'plugins.configs.lsp.servers')
      return {
        ensure_installed = servers,
        automatic_enable = servers,
      }
    end,
  },
}
