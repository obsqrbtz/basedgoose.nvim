local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

local plugin_configs = {
  require 'plugins.configs.guess-indent',
  require 'plugins.configs.gitsigns',
  require 'plugins.configs.floaterm',
  require 'plugins.configs.hardtime',
  require 'plugins.configs.fzf-lua',
  require 'plugins.configs.which-key',
  require 'plugins.configs.lazydev',
  require 'plugins.configs.fidget',
  require 'plugins.configs.conform',
  require 'plugins.configs.autocompletion',
  require 'plugins.configs.todo-comments',
  require 'plugins.configs.mini',
  require 'plugins.configs.treesitter',
  require 'plugins.configs.lsp.mason',
  require 'plugins.configs.lsp.lspconfig',
  require 'plugins.configs.lsp.mason-tool-installer',
}

require('lazy').setup(plugin_configs, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
