return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    signs_staged = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, keys, func, desc)
        vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = 'Git: ' .. desc })
      end

      -- Navigation between changed hunks
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, 'Next [C]hange')

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, 'Previous [C]hange')

      -- Staging. `stage_hunk` toggles: run it on an already-staged hunk to
      -- unstage it. In visual mode it stages only the selected lines.
      map('n', '<leader>hs', gitsigns.stage_hunk, '[S]tage hunk (toggles)')
      map('v', '<leader>hs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, '[S]tage selected lines')
      map('n', '<leader>hS', gitsigns.stage_buffer, '[S]tage entire buffer')

      -- Discarding
      map('n', '<leader>hr', gitsigns.reset_hunk, '[R]eset hunk (discard)')
      map('v', '<leader>hr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, '[R]eset selected lines')
      map('n', '<leader>hR', gitsigns.reset_buffer, '[R]eset entire buffer')

      -- Inspecting
      map('n', '<leader>hp', gitsigns.preview_hunk, '[P]review hunk')
      map('n', '<leader>hb', function()
        gitsigns.blame_line { full = true }
      end, '[B]lame line')
      map('n', '<leader>hd', gitsigns.diffthis, '[D]iff against index')
      map('n', '<leader>hD', function()
        gitsigns.diffthis '@'
      end, '[D]iff against last commit')

      -- Toggles
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, 'Toggle git [B]lame line')
      map('n', '<leader>tw', gitsigns.toggle_word_diff, 'Toggle git [W]ord diff')
    end,
  },
}
