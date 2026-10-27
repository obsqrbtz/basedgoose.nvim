local lazygit_term

local function toggle_lazygit()
  if vim.fn.executable 'lazygit' == 0 then
    vim.notify('lazygit is not installed. Install it with: sudo pacman -S lazygit', vim.log.levels.ERROR)
    return
  end

  if not lazygit_term then
    lazygit_term = require('toggleterm.terminal').Terminal:new {
      cmd = 'lazygit',
      direction = 'float',
      float_opts = { border = 'curved' },
      hidden = true,
      on_open = function(term)
        -- lazygit uses Esc to go back a screen, so it must reach the program
        -- rather than being swallowed by the terminal-mode exit mapping.
        vim.keymap.set('t', '<Esc>', '<Esc>', { buffer = term.bufnr, nowait = true })
        vim.keymap.set('t', '<Esc><Esc>', '<Esc><Esc>', { buffer = term.bufnr, nowait = true })
      end,
      on_close = function()
        vim.cmd 'checktime'
        pcall(function()
          require('gitsigns').refresh()
        end)
      end,
    }
  end

  lazygit_term:toggle()
end

return {
  'akinsho/toggleterm.nvim',
  version = '*',
  cmd = { 'ToggleTerm', 'TermExec', 'Lazygit' },
  opts = {
    direction = 'float',
    float_opts = {
      border = 'curved',
    },
    shade_terminals = false,
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)
    vim.api.nvim_create_user_command('Lazygit', toggle_lazygit, { desc = 'Toggle lazygit' })
  end,
  keys = {
    { '<leader>tt', '<cmd>ToggleTerm<CR>', desc = '[T]oggle [T]erminal' },
    { '<leader>gg', toggle_lazygit, desc = 'Lazy[g]it' },
  },
}
