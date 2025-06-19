return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  keys = {
    {
      '<leader>sf',
      function()
        require('fzf-lua').files {}
      end,
      desc = 'Find Files',
    },
    {
      '<leader>so',
      function()
        require('fzf-lua').oldfiles {}
      end,
      desc = 'Old Files',
    },
    {
      '<leader>sq',
      function()
        require('fzf-lua').quickfix {}
      end,
      desc = 'Quickfix',
    },
    {
      '<leader>st',
      function()
        require('fzf-lua').tabs {}
      end,
      desc = 'Open tabs',
    },
    {
      '<leader>sg',
      function()
        require('fzf-lua').live_grep {}
      end,
      desc = 'Live grep file content',
    },
    {
      '<leader>sb',
      function()
        require('fzf-lua').buffers {}
      end,
      desc = 'Search opened buffers',
    },
    {
      '<leader>sh',
      function()
        require('fzf-lua').manpages {}
      end,
      desc = 'Search help manual page',
    },
    {
      '<leader>sd',
      function()
        require('fzf-lua').diagnostics_workspace {}
      end,
      desc = 'Workspace Diagnostics',
    },
    {
      '<leader>gf',
      function()
        require('fzf-lua').git_files {}
      end,
      desc = 'Git files',
    },
    {
      '<leader>gs',
      function()
        require('fzf-lua').git_status {}
      end,
      desc = 'Git status',
    },
    {
      '<leader>gd',
      function()
        require('fzf-lua').git_diff {}
      end,
      desc = 'Git diff',
    },
    {
      '<leader>gb',
      function()
        require('fzf-lua').git_branches {}
      end,
      desc = 'Git branches',
    },
  },
}
