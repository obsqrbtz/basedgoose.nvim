return {
  'm4xshen/hardtime.nvim',
  lazy = false,
  dependencies = { 'MunifTanjim/nui.nvim' },
  opts = { enabled = false },
  keys = {
    {
      '<leader>ht',
      function()
        require('hardtime').toggle()
      end,
      desc = 'Toggle Hardtime',
    },
  },
}
