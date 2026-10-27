local M = {}

function M.is_nixos()
  return vim.fn.filereadable '/etc/NIXOS' == 1
end

function M.is_windows()
  return vim.uv.os_uname().sysname:find 'Windows' ~= nil
end

function M.is_macos()
  return vim.uv.os_uname().sysname == 'Darwin'
end

return M
