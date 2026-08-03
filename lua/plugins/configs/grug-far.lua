-- Project-wide find and replace.
return {
  'MagicDuck/grug-far.nvim',
  cmd = 'GrugFar',
  opts = {
    headerMaxWidth = 80,
  },
  keys = {
    {
      '<leader>sr',
      function()
        require('grug-far').open()
      end,
      desc = 'Search and [R]eplace (regex)',
    },
    {
      '<leader>sR',
      function()
        -- `--fixed-strings` makes the search term literal: no regex characters,
        -- no escaping, exactly what you typed.
        require('grug-far').open { prefills = { flags = '--fixed-strings' } }
      end,
      desc = 'Search and [R]eplace (exact match)',
    },
    {
      '<leader>sw',
      function()
        require('grug-far').open {
          prefills = {
            search = vim.fn.expand '<cword>',
            flags = '--fixed-strings --word-regexp',
          },
        }
      end,
      desc = 'Search and replace [W]ord under cursor',
    },
  },
}
