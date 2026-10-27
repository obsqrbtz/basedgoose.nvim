local headers = {
  goose_small = {
    [[╔╗ ╔═╗╔═╗╔═╗╔╦╗╔═╗╔═╗╔═╗╔═╗╔═╗]],
    [[╠╩╗╠═╣╚═╗║╣  ║║║ ╦║ ║║ ║╚═╗║╣ ]],
    [[╚═╝╩ ╩╚═╝╚═╝═╩╝╚═╝╚═╝╚═╝╚═╝╚═╝]],
  },
  goose_shadow = {
    [[██████╗  █████╗ ███████╗███████╗██████╗  ██████╗  ██████╗  ██████╗ ███████╗███████╗]],
    [[██╔══██╗██╔══██╗██╔════╝██╔════╝██╔══██╗██╔════╝ ██╔═══██╗██╔═══██╗██╔════╝██╔════╝]],
    [[██████╔╝███████║███████╗█████╗  ██║  ██║██║  ███╗██║   ██║██║   ██║███████╗█████╗  ]],
    [[██╔══██╗██╔══██║╚════██║██╔══╝  ██║  ██║██║   ██║██║   ██║██║   ██║╚════██║██╔══╝  ]],
    [[██████╔╝██║  ██║███████║███████╗██████╔╝╚██████╔╝╚██████╔╝╚██████╔╝███████║███████╗]],
    [[╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═════╝  ╚═════╝  ╚═════╝  ╚═════╝ ╚══════╝╚══════╝]],
  },
  goose_bloody = {
    [[ ▄▄▄▄    ▄▄▄        ██████ ▓█████ ▓█████▄   ▄████  ▒█████   ▒█████    ██████ ▓█████ ]],
    [[▓█████▄ ▒████▄    ▒██    ▒ ▓█   ▀ ▒██▀ ██▌ ██▒ ▀█▒▒██▒  ██▒▒██▒  ██▒▒██    ▒ ▓█   ▀ ]],
    [[▒██▒ ▄██▒██  ▀█▄  ░ ▓██▄   ▒███   ░██   █▌▒██░▄▄▄░▒██░  ██▒▒██░  ██▒░ ▓██▄   ▒███   ]],
    [[▒██░█▀  ░██▄▄▄▄██   ▒   ██▒▒▓█  ▄ ░▓█▄   ▌░▓█  ██▓▒██   ██░▒██   ██░  ▒   ██▒▒▓█  ▄ ]],
    [[░▓█  ▀█▓ ▓█   ▓██▒▒██████▒▒░▒████▒░▒████▓ ░▒▓███▀▒░ ████▓▒░░ ████▓▒░▒██████▒▒░▒████▒]],
    [[░▒▓███▀▒ ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░░░ ▒░ ░ ▒▒▓  ▒  ░▒   ▒ ░ ▒░▒░▒░ ░ ▒░▒░▒░ ▒ ▒▓▒ ▒ ░░░ ▒░ ░]],
    [[▒░▒   ░   ▒   ▒▒ ░░ ░▒  ░ ░ ░ ░  ░ ░ ▒  ▒   ░   ░   ░ ▒ ▒░   ░ ▒ ▒░ ░ ░▒  ░ ░ ░ ░  ░]],
    [[ ░    ░   ░   ▒   ░  ░  ░     ░    ░ ░  ░ ░ ░   ░ ░ ░ ░ ▒  ░ ░ ░ ▒  ░  ░  ░     ░   ]],
    [[ ░            ░  ░      ░     ░  ░   ░          ░     ░ ░      ░ ░        ░     ░  ░]],
    [[      ░                            ░                                              ]],
  },
}

local active_header = headers.goose_small

local function has_vault()
  for _, path in ipairs(vim.split(vim.env.OBSIDIAN_VAULTS or '', ':', { trimempty = true })) do
    if vim.fn.isdirectory(vim.fs.normalize(path)) == 1 then
      return true
    end
  end
  return vim.fs.root(vim.fn.getcwd(), '.obsidian') ~= nil
end

local function shortcuts()
  local function item(key, icon, desc, action)
    return { key = key, icon = icon .. ' ', icon_hl = '@variable', desc = desc, group = 'Label', action = action }
  end
  local fzf = function(picker, opts)
    return function()
      require('fzf-lua')[picker](opts)
    end
  end

  local items = {
    item('f', '', 'Files', fzf 'files'),
    item('g', '', 'Grep', fzf 'live_grep'),
    item('r', '', 'Recent', fzf 'oldfiles'),
  }
  if has_vault() then
    table.insert(items, item('o', '', 'Today', 'Obsidian today'))
  end
  if vim.fn.executable 'lazygit' == 1 then
    table.insert(items, item('l', '', 'Lazygit', 'Lazygit'))
  end
  vim.list_extend(items, {
    item('c', '', 'Config', fzf('files', { cwd = vim.fn.stdpath 'config' })),
    item('u', '', 'Update', 'Lazy update'),
    item('q', '', 'Quit', 'qa'),
  })
  return items
end

local function git_footer()
  if vim.fn.executable 'git' == 0 then
    return {}
  end
  local result = vim.system({ 'git', 'status', '--porcelain=v2', '--branch' }, { text = true }):wait(1000)
  if result.code ~= 0 then
    return {}
  end

  local branch, oid, ahead, behind = nil, nil, 0, 0
  local staged, modified, untracked, conflicts = 0, 0, 0, 0
  for line in vim.gsplit(result.stdout, '\n', { trimempty = true }) do
    local kind = line:sub(1, 1)
    if vim.startswith(line, '# branch.head ') then
      branch = line:sub(15)
    elseif vim.startswith(line, '# branch.oid ') then
      oid = line:sub(14, 20)
    elseif vim.startswith(line, '# branch.ab ') then
      local a, b = line:match '%+(%d+) %-(%d+)'
      ahead, behind = tonumber(a), tonumber(b)
    elseif kind == '1' or kind == '2' then
      staged = staged + (line:sub(3, 3) ~= '.' and 1 or 0)
      modified = modified + (line:sub(4, 4) ~= '.' and 1 or 0)
    elseif kind == 'u' then
      conflicts = conflicts + 1
    elseif kind == '?' then
      untracked = untracked + 1
    end
  end

  local head = { ' ' .. (branch == '(detached)' and oid or branch) }
  if ahead > 0 then
    table.insert(head, '↑' .. ahead)
  end
  if behind > 0 then
    table.insert(head, '↓' .. behind)
  end

  local changes = {}
  for _, count in ipairs {
    { conflicts, 'conflicted' },
    { staged, 'staged' },
    { modified, 'modified' },
    { untracked, 'untracked' },
  } do
    if count[1] > 0 then
      table.insert(changes, count[1] .. ' ' .. count[2])
    end
  end

  return { '', table.concat(head, ' ') .. '  ·  ' .. (#changes > 0 and table.concat(changes, ', ') or 'clean') }
end

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      config = {
        header = active_header,
        week_header = {
          enable = false,
        },
        shortcut = shortcuts(),
        packages = { enable = false },
        project = {
          limit = 4,
          action = function(path)
            require('fzf-lua').files { cwd = path }
          end,
        },
        mru = { limit = 5, cwd_only = true },
        footer = git_footer,
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
