return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    local utils = require('utils')
    local servers = { 'clangd', 'pyright', 'rust_analyzer', 'ts_ls', 'lua_ls', 'nil_ls' }
    local tools = { 'stylua', 'clang-format' }
    local ensure_installed = utils.is_nixos() and {} or vim.list_extend(servers, tools)
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }
  end,
}
