-- Obsidian vaults
local function vault_of(source)
  return vim.fs.root(source, '.obsidian')
end

local function workspaces()
  local paths = {}
  for _, path in ipairs(vim.split(vim.env.OBSIDIAN_VAULTS or '', ':', { trimempty = true })) do
    path = vim.fs.normalize(path)
    if vim.fn.isdirectory(path) == 1 then
      table.insert(paths, path)
    end
  end
  for _, path in ipairs { vault_of(0), vault_of(vim.fn.getcwd()) } do
    if path and not vim.list_contains(paths, path) then
      table.insert(paths, path)
    end
  end
  return vim.tbl_map(function(path)
    return { path = path }
  end, paths)
end

return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  cmd = 'Obsidian',
  init = function()
    vim.api.nvim_create_autocmd('FileType', {
      desc = 'Load obsidian.nvim for notes inside a vault',
      pattern = 'markdown',
      group = vim.api.nvim_create_augroup('obsidian-vault', { clear = true }),
      callback = function(event)
        if not vault_of(event.buf) then
          return
        end
        -- obsidian.nvim's UI (checkboxes, links, etc.) needs conceal enabled
        vim.opt_local.conceallevel = 2
        if package.loaded.obsidian then
          return
        end
        require('lazy').load { plugins = { 'obsidian.nvim' } }
        -- obsidian.nvim sets a note up from FileType and BufEnter, which have
        -- already fired for the buffer that triggered loading it.
        for _, autocmd in ipairs { 'FileType', 'BufEnter' } do
          if vim.fn.exists('#obsidian_setup#' .. autocmd) == 1 then
            vim.api.nvim_exec_autocmds(autocmd, { group = 'obsidian_setup', buffer = event.buf, modeline = false })
          end
        end
      end,
    })
  end,
  ---@module 'obsidian'
  ---@return obsidian.config
  opts = function()
    return {
      legacy_commands = false,
      workspaces = workspaces(),
      picker = { name = 'fzf-lua' },
    }
  end,
  config = function(_, opts)
    if #opts.workspaces == 0 then
      vim.api.nvim_create_user_command('Obsidian', function()
        vim.notify('No Obsidian vault found: open a note inside one, or list vaults in $OBSIDIAN_VAULTS', vim.log.levels.WARN)
      end, { nargs = '*', force = true })
      return
    end
    require('obsidian').setup(opts)
  end,
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
