vim.cmd('highlight clear')
vim.cmd('syntax reset')
vim.g.colors_name = 'cursed'

local palette = {
  base00 = '#151515',
  base01 = '#b44242',
  base02 = '#95a328',
  base03 = '#e1c135',
  base04 = '#60928f',
  base05 = '#7c435a',
  base06 = '#a48b4a',
  base07 = '#c2c2b0',
  base08 = '#3f3639',
  base09 = '#dc7671',
  base0A = '#e8e85a',
  base0B = '#9e9052',
  base0C = '#76c39b',
  base0D = '#86596c',
  base0E = '#ceb34f',
  base0F = '#b0afa8',
}

local function set_hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Basic highlights
set_hl('Normal', { fg = palette.base07, bg = palette.base00 })
set_hl('Comment', { fg = palette.base0F, italic = false })
set_hl('Constant', { fg = palette.base0C })
set_hl('String', { fg = palette.base0B })
set_hl('Identifier', { fg = palette.base0E })
set_hl('Function', { fg = palette.base0A })
set_hl('Statement', { fg = palette.base09 })
set_hl('PreProc', { fg = palette.base0D })
set_hl('Type', { fg = palette.base04 })
set_hl('Special', { fg = palette.base03 })
set_hl('Underlined', { fg = palette.base05 })
set_hl('Error', { fg = palette.base01, bg = palette.base00 })
set_hl('Todo', { fg = palette.base00, bg = palette.base03 })

-- Line numbers
set_hl('LineNr', { fg = palette.base08 })
set_hl('CursorLineNr', { fg = palette.base0A })

-- Cursor and selection
set_hl('CursorLine', { bg = palette.base08 })
set_hl('Visual', { bg = palette.base05 })

-- Status line
set_hl('StatusLine', { fg = palette.base00, bg = palette.base0E })
set_hl('StatusLineNC', { fg = palette.base08, bg = palette.base00 })

-- Tabline
set_hl('TabLine', { fg = palette.base07, bg = palette.base08 })
set_hl('TabLineSel', { fg = palette.base00, bg = palette.base03 })

-- Completion menu
set_hl('Pmenu', { fg = palette.base07, bg = palette.base08 })
set_hl('PmenuSel', { fg = palette.base00, bg = palette.base0A })

-- Diff
set_hl('DiffAdd', { fg = palette.base02, bg = palette.base00 })
set_hl('DiffChange', { fg = palette.base03, bg = palette.base00 })
set_hl('DiffDelete', { fg = palette.base01, bg = palette.base00 })
set_hl('DiffText', { fg = palette.base0A, bg = palette.base00 })

-- Diagnostics
set_hl('DiagnosticError', { fg = palette.base01 })
set_hl('DiagnosticWarn', { fg = palette.base03 })
set_hl('DiagnosticInfo', { fg = palette.base04 })
set_hl('DiagnosticHint', { fg = palette.base0E })

-- Git signs
set_hl('GitSignsAdd', { fg = palette.base02 })
set_hl('GitSignsChange', { fg = palette.base03 })
set_hl('GitSignsDelete', { fg = palette.base01 })

-- Treesitter
set_hl('@string', { link = 'String' })
set_hl('@function', { link = 'Function' })
set_hl('@variable', { fg = palette.base07 })
