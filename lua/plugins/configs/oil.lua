-- File manager
return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  opts = {
    default_file_explorer = true,
    delete_to_trash = true,
    skip_confirm_for_simple_edits = false,
    view_options = {
      show_hidden = true,
    },
    -- Rewrite imports/includes
    lsp_file_methods = {
      enabled = true,
      timeout_ms = 1000,
      autosave_changes = true,
    },
    keymaps = {
      ['q'] = { 'actions.close', mode = 'n' },
    },
  },
  keys = {
    { '-', '<cmd>Oil<CR>', desc = 'Open parent directory' },
    {
      '<leader>-',
      function()
        require('oil').toggle_float()
      end,
      desc = 'Open parent directory (floating)',
    },
  },
}
