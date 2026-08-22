local utils = require 'utils'

return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  enabled = not utils.is_nixos(),
  dependencies = { 'mason-org/mason.nvim' },
  opts = { ensure_installed = { 'stylua', 'clang-format', 'tree-sitter-cli', 'yamlfmt', 'dockerfmt' } },
}
