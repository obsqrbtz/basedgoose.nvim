-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- `shows readable diag under the current line
local diag_augroup = vim.api.nvim_create_augroup('diagnostic-virtual-lines', { clear = true })

vim.api.nvim_create_autocmd('InsertEnter', {
  desc = 'Hide diagnostic virtual lines while typing',
  group = diag_augroup,
  callback = function()
    vim.diagnostic.config { virtual_lines = false }
  end,
})

vim.api.nvim_create_autocmd('InsertLeave', {
  desc = 'Restore diagnostic virtual lines after typing',
  group = diag_augroup,
  callback = function()
    vim.diagnostic.config { virtual_lines = { current_line = true } }
  end,
})

-- Transparent background + italic comments. Loading a colorscheme clears all
-- highlights, so these have to be reapplied every time rather than set once.
-- `nvim_set_hl` replaces a group outright (unlike `:highlight`, which merges),
-- so patch the colorscheme's own definition instead of clobbering it.
local function patch_hl(group, overrides)
  local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
  vim.api.nvim_set_hl(0, group, vim.tbl_extend('force', hl, overrides))
end

local function apply_overrides()
  patch_hl('Normal', { bg = 'none', ctermbg = 'none' })
  patch_hl('NormalNC', { bg = 'none', ctermbg = 'none' })
  patch_hl('Comment', { italic = true })
end

vim.api.nvim_create_autocmd('ColorScheme', {
  desc = 'Reapply transparent background and italic comments',
  group = vim.api.nvim_create_augroup('theme-overrides', { clear = true }),
  callback = apply_overrides,
})

apply_overrides()

-- Filenames alone are not enough: a stack usually keeps its services in files
-- named after the service (`immich.yaml`, `arr.yaml`) and reduces `compose.yaml`
-- to a list of `include:`s.
local function is_compose(_, bufnr)
  if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
    return nil
  end
  for _, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, 200, false)) do
    if line:match '^services:%s*$' or line:match '^services:%s*#' then
      return 'yaml.docker-compose'
    end
  end
  return nil
end

vim.filetype.add {
  filename = {
    ['compose.yaml'] = 'yaml.docker-compose',
    ['compose.yml'] = 'yaml.docker-compose',
    ['docker-compose.yaml'] = 'yaml.docker-compose',
    ['docker-compose.yml'] = 'yaml.docker-compose',
  },
  pattern = {
    ['.*/compose%..+%.ya?ml'] = 'yaml.docker-compose',
    ['.*/docker%-compose%..+%.ya?ml'] = 'yaml.docker-compose',
    ['.*/%.gitlab%-ci%.ya?ml'] = { 'yaml', { priority = 10 } },
    ['.*%.ya?ml'] = is_compose,
  },
}
