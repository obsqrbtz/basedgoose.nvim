-- Diag
return {
  'folke/trouble.nvim',
  cmd = 'Trouble',
  opts = {
    focus = true,
    auto_jump = false,
  },
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<CR>',
      desc = 'Diagnostics (project)',
    },
    {
      '<leader>xd',
      '<cmd>Trouble diagnostics toggle filter.buf=0<CR>',
      desc = 'Diagnostics (this file)',
    },
    {
      '<leader>xe',
      '<cmd>Trouble diagnostics toggle filter.severity=vim.diagnostic.severity.ERROR<CR>',
      desc = 'Diagnostics (errors only)',
    },
    {
      '<leader>xs',
      '<cmd>Trouble symbols toggle<CR>',
      desc = 'Symbols outline',
    },
    {
      '<leader>xq',
      '<cmd>Trouble qflist toggle<CR>',
      desc = 'Quickfix list',
    },
  },
}
