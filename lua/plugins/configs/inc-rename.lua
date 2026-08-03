-- Live preview for LSP rename: every affected line updates as you type the new
-- name. Relies on `inccommand`, which is set in options.lua.
return {
  'smjonas/inc-rename.nvim',
  cmd = 'IncRename',
  opts = {},
}
