-- Obsidian vaults
return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  ft = 'markdown',
  cmd = 'Obsidian',
  init = function()
    -- obsidian.nvim's UI (checkboxes, links, etc.) needs conceal enabled
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'markdown',
      callback = function()
        vim.opt_local.conceallevel = 2
      end,
    })
  end,
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
    workspaces = {
      { name = 'knowledge', path = '~/Seafile/Knowledge' },
    },
    picker = { name = 'fzf-lua' },
  },
  keys = {
    { '<leader>of', '<cmd>Obsidian quick_switch<CR>', desc = 'Find note' },
    { '<leader>og', '<cmd>Obsidian search<CR>', desc = 'Grep notes' },
    { '<leader>ow', '<cmd>Obsidian workspace<CR>', desc = 'Switch vault' },
    { '<leader>on', '<cmd>Obsidian new<CR>', desc = 'New note' },
    { '<leader>ob', '<cmd>Obsidian backlinks<CR>', desc = 'Backlinks' },
    { '<leader>ol', '<cmd>Obsidian links<CR>', desc = 'Links in note' },
    { '<leader>ot', '<cmd>Obsidian tags<CR>', desc = 'Tags' },
    { '<leader>od', '<cmd>Obsidian today<CR>', desc = 'Daily note' },
  },
}
