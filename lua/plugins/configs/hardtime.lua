return {
  'm4xshen/hardtime.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  opts = { enabled = false },
  keys = {
    {
      '<leader>tH',
      function()
        require('hardtime').toggle()
      end,
      desc = 'Toggle [H]ardtime',
    },
  },
}
