return {
  'NotAShelf/direnv.nvim',
  -- Machines without direnv (servers, containers) would otherwise error on startup.
  cond = function()
    return vim.fn.executable 'direnv' == 1
  end,
  config = function()
    require('direnv').setup {}
  end,
}
